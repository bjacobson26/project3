class Product < ActiveRecord::Base
	belongs_to :category
	# has_many :orders, through :order_details
	has_many :product_images

end
