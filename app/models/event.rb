class Event < ActiveRecord::Base

validates :user_id, presence: true
validates :calendar_id, presence: true
validates :name, presence: true
validates :starting_time, presence: true
validates :ending_time, presence: true

has_many :comments, dependent: :destroy
has_many :activities, dependent: :destroy
belongs_to :calendar
belongs_to :user

mount_uploader :image, ImageUploader


end
