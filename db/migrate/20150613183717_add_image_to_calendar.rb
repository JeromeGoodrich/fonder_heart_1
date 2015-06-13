class AddImageToCalendar < ActiveRecord::Migration
  def change
    add_column :calendars, :image, :string
  end
end
