class Calendar < ActiveRecord::Base


belongs_to :user
has_many :events
has_many :users
has_many :comments
has_many :calendar_accesses

end
