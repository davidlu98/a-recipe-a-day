class User < ApplicationRecord
  attr_accessor :password, :password_confirmation, :encrypted_password
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


  before_save :encrypt_password

  require 'digest/sha1'

  def encrypt_password
    if password.present?
      self.encrypted_password = Digest::SHA1.hexdigest(password)
    end
  end

  def authenticate(password)
    encrypted_password == Digest::SHA1.hexdigest(password)
  end

  validates :password, presence: true, length: { minimum: 6 }
end
