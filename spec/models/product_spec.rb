require 'rails_helper'

RSpec.describe Product, :type => :model do
	before(:each) do
 		@product1 = Product.create(name:"Apple", unit_price: 100, description:"super awesome", material:"wood", category_id:4)
	end

	describe Product do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:category_id)}
		it { should have_many(:orders)}
		it { should have_many(:product_images)}
		it { should have_db_column(:material)}
		it { should have_db_column(:category_id)}


	end

end