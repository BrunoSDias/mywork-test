class ChangeDurationCheckinCheckoutFromItToBigtint < ActiveRecord::Migration[5.1]
  def change
    def up
      change_table :timetrackings do |t|
        t.change :duration, :bigint
        t.change :checkin, :bigint
        t.change :checkout, :bigint
      end
    end
    def down
      change_table :timetrackings do |t|
        t.change :duration, :int
        t.change :checkin, :int
        t.change :checkout, :int
      end
    end
  end
end
