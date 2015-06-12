class Comment < ActiveRecord::Base

validates :user_id, presence: true
validates :event_id, presence: true
validates :calendar_id, presence: true

belongs_to :event
belongs_to :user
belongs_to :calendar

end
