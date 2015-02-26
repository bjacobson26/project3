require 'bcrypt' #this must be at the top of the file

class User < ActiveRecord::Base
	has_secure_password

	has_many :orders


end
