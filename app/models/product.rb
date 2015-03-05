class Product < ActiveRecord::Base

	# has_many :orders, through :order_details
	has_many :product_images

	belongs_to :category

	
	has_attached_file :avatar, 
	:styles => { 
    :medium => "300x300>", 
    :thumb => "100x100>" }, 
    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
