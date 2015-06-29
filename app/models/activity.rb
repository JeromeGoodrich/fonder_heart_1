class Activity < ActiveRecord::Base

validates :name, presence: true
validates :starting_time, presence: true
validates :ending_time, presence: true

has_many :comments
belongs_to :event
belongs_to :user

mount_uploader :image, ImageUploader

end
