class CreateCalendarAccesses < ActiveRecord::Migration
  def change
    create_table :calendar_accesses do |t|
      t.integer :user_id
      t.integer :calendar_id

      t.timestamps

    end
  end
end
