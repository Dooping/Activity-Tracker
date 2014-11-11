class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.date :birth
      t.string :gender
      t.integer :weight
      t.string :country
      t.text :info

      t.timestamps null: false
    end
  end
end
