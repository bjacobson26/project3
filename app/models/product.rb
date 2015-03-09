class Product < ActiveRecord::Base
	has_many :orders, through: :order_details
	has_many :product_images
	accepts_nested_attributes_for :product_images

	belongs_to :category

	
	has_attached_file :avatar, 
	:styles => { 
    :medium => "300x300>", 
    :thumb => "100x100>" }

  has_attached_file :image,

                    :storage => :s3,
                    :bucket => "scottmeskilldesigns",
                    :s3_host_name => 's3-us-west-1.amazonaws.com',
                    :url =>':s3_domain_url',
                    :path => '/:class/:attachment/:id_partition/:style/:filename',
                    :s3_credentials => {
                        :bucket => ENV['AWS_BUCKET'],
                        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    }

  validates_attachment :image,
                       :image_content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }


  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :category_id
  validates_presence_of :name

end
