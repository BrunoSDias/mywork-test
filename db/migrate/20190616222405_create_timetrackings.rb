class CreateTimetrackings < ActiveRecord::Migration[5.1]
  def change
    create_table :timetrackings do |t|
      t.float :latitude
      t.float :longitude
      t.integer :duration, limit: 8
      t.integer :checkin, limit: 8
      t.integer :checkout, limit: 8

      t.timestamps
    end
  end
end
