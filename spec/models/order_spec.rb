require 'rails_helper'

RSpec.describe Order, :type => :model do
	before(:each) do
 		@order1 = Order.create(product_id:1, user_id:2)
 	end

	describe Order do
		it { should belong_to(:product)}
		it { should belong_to(:user)}
		it { should have_db_column(:order_date)}
	end

end