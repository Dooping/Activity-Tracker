class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :leader_id
      t.text :description
      t.integer :sport_id
      t.integer :profile_id

      t.timestamps null: false
    end
  end
end
