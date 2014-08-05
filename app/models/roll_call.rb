class RollCall < ActiveRecord::Base
  belongs_to    :user
  belongs_to    :group
  has_many      :selfies 

  validates :group, presence: true
  validates :user, presence: true
end
