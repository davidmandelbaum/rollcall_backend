class AuthKey < ActiveRecord::Base
  belongs_to :user

  before_create :generate_token

  def generate_token
    begin
      self.auth_key = SecureRandom.hex.to_s
    end while self.class.exists?(auth_key: auth_key)
  end
end
