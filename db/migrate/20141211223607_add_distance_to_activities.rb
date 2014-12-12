class AddDistanceToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :distance, :integer
  end
end
