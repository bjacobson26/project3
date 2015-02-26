class Product < ActiveRecord::Base

	has_many :orders, through :order_details
	has_many :product_images

	belongs_to :sub_category
end
