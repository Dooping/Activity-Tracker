class AddUserId2ToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :user_id2, :integer
  end
end
