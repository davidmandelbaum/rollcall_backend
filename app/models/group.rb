class Group < ActiveRecord::Base
  has_many      :memberships, dependent: :delete_all
  has_many      :users, through: :memberships
  has_many      :roll_calls

end
