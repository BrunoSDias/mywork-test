class TimetrackingsController < ApplicationController
  before_action :set_timetracking, only: [:show, :edit, :update, :destroy]

  def index
    @timetrackings = Timetracking.all
  end

  def show
  end

  def new
    if params[:id].to_s == ""
      @timetracking = Timetracking.new
    else
      @timetracking = Timetracking.find(params[:id])
    end
  end

  def create
    @timetracking = Timetracking.new(timetracking_params)
    lat1 = @timetracking.latitude
    long1 = @timetracking.longitude

    Geofence.all.each do |g|
      dist = distance(lat1, long1, g.latitude, g.longitude)
      if dist <= (g.radius/1000)
        @inside = true
        respond_to do |format|
          if @timetracking.save
            format.html { render :new, id: @timetracking.id }
            format.json { render :show, status: :created, location: @timetracking }
          else
            format.html { render :new }
            format.json { render json: @timetracking.errors, status: :unprocessable_entity }
          end
        end
      end
    end

    unless @inside
      flash[:error] = "You can not check-in outside the work area "
      render :new
    end
  end

  def update

    lat1 = @timetracking.latitude
    long1 = @timetracking.longitude

    Geofence.all.each do |g|
      dist = distance(lat1, long1, g.latitude, g.longitude)
      if dist <= (g.radius / 1000)
        @outside = true
        respond_to do |format|
          if @timetracking.update(timetracking_params)
            format.html { redirect_to new_timetracking_path }
            format.json { render :show, status: :ok, location: @timetracking }
          else
            format.html { render :new }
            format.json { render json: @timetracking.errors, status: :unprocessable_entity }
          end
        end
      end
    end

    unless @outside
      flash[:error] = "You can not check-out while you are outside the work area "
      render :new
    end
  end

  def destroy
    @timetracking.destroy
    respond_to do |format|
      format.html { redirect_to timetrackings_url, notice: 'Timetracking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def distance(lat1, long1, lat2, long2)
      return 6371 * Math.acos(Math.cos(Math::PI*(90-lat2)/180)*
                              Math.cos((90-lat1)*Math::PI/180)+
                              Math.sin((90-lat2)*Math::PI/180)*
                              Math.sin((90-lat1)*Math::PI/180)*
                              Math.cos((long1-long2)*
                              Math::PI/180))
    end

    def set_timetracking
      @timetracking = Timetracking.find(params[:id])
    end

    def timetracking_params
      params.require(:timetracking).permit(:latitude, :longitude, :duration, :checkout, :checkin, :comment)
    end
end
