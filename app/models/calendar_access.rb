class CalendarAccess < ActiveRecord::Base

validates :user_id, presence: true
validates :calendar_id, presence: true

belongs_to :calendar
belongs_to :user

end
