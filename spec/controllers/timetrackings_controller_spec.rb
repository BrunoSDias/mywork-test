require 'rails_helper'

RSpec.describe TimetrackingsController, type: :controller do
  describe "GET new" do
    context "verify if " do
      it "assign empty instance variable" do
        get :new
        timetracking = assigns(:timetracking)

        expect(timetracking).to be_a(Timetracking)
        expect(timetracking.id).to be_nil
        expect(response).to render_template("new")
      end

      it "render with not empty instance variable" do
        Timetracking.destroy_all
        timetracking = Timetracking.create!(latitude: -21.3194, longitude: -49.052, checkin: 1560874347611)
        get :new, params: {id: timetracking.id}

        ttracking = assigns(:timetracking)
        expect(ttracking.id).to eq(timetracking.id)
        expect(response).to render_template("new")
      end
    end
  end

  describe "POST create" do
    context "verify if " do
      it "render new template with localization error" do
        post :create, :params => { :timetracking => { :latitude => 999999, :longitude => 999999, :checkin => 1560884347911} }
        expect(flash[:error]).to be_present
        expect(response).to render_template("new")
      end

      it "render new template sending id param" do
        post :create, params: { timetracking: {latitude: -21.3194, longitude: -49.052, checkin: 1560874347611} }
        ttracking = assigns(:timetracking)

        expect(id: ttracking.id).to be_present
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH update" do
    context "verify if " do
      it "render new template with localization error" do
        timetracking = Timetracking.create!(latitude: -21.3194, longitude: -49.052, checkin: 1560874347611)
        patch :update, :params => { :id => timetracking.id, :timetracking => { :latitude => 999999, :longitude => 999999, :checkin => 1560884347911, :checkout => 1560884357911} }
        expect(flash[:error]).to be_present
        expect(response).to render_template("new")
      end
    end
  end
end
