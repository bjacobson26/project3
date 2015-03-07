class Order < ActiveRecord::Base
	has_many :products, through: :order_details
	belongs_to :user
end
