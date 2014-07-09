class User < ActiveRecord::Base
  # Associations
  
  has_many      :groups, through: :memberships
  has_many      :likes
  has_many      :selfies
  has_many      :roll_calls
  
  # Validations

  validates     :phone_number,  presence: true
  # phone number validation
  validates     :password,      presence: true
  validates     :UDID,          presence: true

  # Attachments

  has_attached_file                 :avatar
  validates_attachment_content_type :avatar,
                                    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
