class Photo < ActiveRecord::Base
  belongs_to    :user
  belongs_to    :roll_call
  has_many      :likes

  has_attached_file :picture

  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
