class AddSportIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :sport_id, :integer
  end
end
