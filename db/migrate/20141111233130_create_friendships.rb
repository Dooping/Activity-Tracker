class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.string :email1
      t.string :email2
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
