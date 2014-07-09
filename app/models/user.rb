class User < ActiveRecord::Base
  has_many      :groups, through: :memberships
  has_many      :likes
  has_many      :selfies
  has_many      :roll_calls
end
