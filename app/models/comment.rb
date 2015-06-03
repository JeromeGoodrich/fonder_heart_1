class Comment < ActiveRecord::Base

belongs_to :event
belongs_to :user
belongs_to :calendar

end
