require 'rails_helper'

RSpec.describe User, :type => :model do
	before(:each) do
 		@user1 = User.create(first_name:"Colonel", last_name:"Mustard", email:"yellowstuff@gmail.com", password:"Guldens")
	end

  describe User do
  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:first_name)}
  it { should validate_presence_of(:last_name)}
  it { should validate_uniqueness_of(:email) }
  it { should validate_confirmation_of(:password)}
  it { should have_secure_password }
  it { should have_many(:orders)}
	end
end



