class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :duration
      t.time :initialTime
      t.string :place
      t.string :gpx

      t.timestamps null: false
    end
  end
end
