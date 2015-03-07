require 'bcrypt' #this must be at the top of the file

class User < ActiveRecord::Base
	has_secure_password
	validates_uniqueness_of :email
	validates_presence_of :email

	has_many :orders


end
