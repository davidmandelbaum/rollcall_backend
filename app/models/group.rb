class Group < ActiveRecord::Base
  has_many      :memberships, dependent: :delete_all
  has_many      :users, through: :memberships

end
