class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :invited_calendars, through: :calendar_accesses, :source => :calendar
has_many :events
has_many :comments
has_many :calendar_accesses, dependent: :destroy
has_many :calendars
has_many :activities



end
