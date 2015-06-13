class Activity < ActiveRecord::Base

has_many :comments
belongs_to :event
belongs_to :calendar, through: :events
belongs_to :user, through: :events

end
