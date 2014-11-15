class AddTypeToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :acttype, :string
  end
end
