class Event < ActiveRecord::Base

validates :name, presence: true
validates :starting_time, presence: true
validates :ending_time, presence: true

has_many :comments
belongs_to :calendar
belongs_to :user




end
