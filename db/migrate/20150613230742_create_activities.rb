class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.datetime :starting_time
      t.datetime :ending_time
      t.integer :user_id
      t.integer :event_id
      t.text :description
      t.string :image

      t.timestamps

    end
  end
end
