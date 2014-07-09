class Photo < ActiveRecord::Base
  belongs_to    :user
  belongs_to    :roll_call
  has_many      :likes
end
