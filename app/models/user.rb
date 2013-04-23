class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  
  # Rails built in method to require presence of a password,
  # require that they match, and add an authenticate method
  # to compare an encrypted password to the password_digest
  # to authenticate users
  has_secure_password
  
  #ensure email uniqueness by converting email address to lower case
  # using before_save callback
  before_save { |user| user.email = email.downcase }
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
              
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
end