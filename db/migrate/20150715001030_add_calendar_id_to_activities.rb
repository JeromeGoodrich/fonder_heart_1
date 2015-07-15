class AddCalendarIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :calendar_id, :integer
  end
end
