class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
    
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  validates :login, length: { in: 2..20 }, presence: true, uniqueness: true
  
  VALID_EMAIL_REGEX = /\A[a-z0-9!#$%&'*+\/=?^_{|}~-]+(?:.[a-z0-9!#$%&'*+\/=?^_{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[a-z]{2}|com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum)\b\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX , uniqueness: { case_sensitive: false }}
  validates :password, length: { minimum: 6 }
 
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
  
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
  
  def validate_password?
    new_record? || !password.nil?
  end
end
