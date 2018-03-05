class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  #enum role: [:regular, :admin]
  #after_initialize :set_default_role, :if => :new_record?

  #def set_default_role
  #  self.role ||= :regular
  #end

  #attr_accessor :password, :password_confirmation, :encrypted_password
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


  #before_save :encrypt_password


  #require 'digest/sha1'

  #def encrypt_password
  #    self.password_digest = Digest::SHA1.hexdigest(password)
  #end

  #def authenticate(password)
  #  return self.password_digest == Digest::SHA1.hexdigest(password)

  #end
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def feed
    Micropost.where("user_id = ?", id)
  end
  
end
