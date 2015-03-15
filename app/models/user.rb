require 'bcrypt' #this must be at the top of the file

class User < ActiveRecord::Base
  attr_accessor :reset_token
  validates_presence_of :first_name
  validates_presence_of :last_name

	has_secure_password
	validates_uniqueness_of :email
	validates_presence_of :email

	has_many :orders

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end




end
