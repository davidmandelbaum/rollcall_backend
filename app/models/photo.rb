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

  # handle uploading
  
  attr_accessor :image_data

  before_save :decode_image_data

  def decode_image_data
    if self.image_data.present?
      data = StringIO.new(Base64.decode64(self.image_data))
      data.class.class_eval {attr_accessor :original_filename, :content_type}
      data.original_filename = self.id.to_s + ".png"
      data.content_type = "image/png"

      self.picture = data
    end
  end

end
