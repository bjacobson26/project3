class OrderDetail < ActiveRecord::Base
	belongs_to :order
	belongs_to :product
  has_many :users

end

