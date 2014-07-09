class Photo < ActiveRecord::Base
  # Associations

  belongs_to    :user
  belongs_to    :roll_call
  has_many      :likes

  # Validations
  validates     :user,        presence: true
  validates     :roll_call,   presence: true

  # Attachments

  has_attached_file                 :picture
  validates_attachment_content_type :picture, 
                                    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
