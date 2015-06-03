class User < ActiveRecord::Base

has_many :calendars
has_many :events
has_many :comments
belongs_to :calendar


end
