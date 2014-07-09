class User < ActiveRecord::Base
  has_many      :groups, through: :memberships
  has_many      :likes
  has_many      :selfies
  has_many      :roll_calls

  has_attached_file :avatar

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
