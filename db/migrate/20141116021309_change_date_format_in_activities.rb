class ChangeDateFormatInActivities < ActiveRecord::Migration
  def up
    change_column :activities, :initialTime, :time
  end

  def down
    change_column :activities, :initialTime, :datetime
  end
end
