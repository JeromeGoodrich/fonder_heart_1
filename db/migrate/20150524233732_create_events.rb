class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :calendar_id
      t.string :name
      t.datetime :starting_time
      t.datetime :ending_time
      t.text :description

      t.timestamps

    end
  end
end
