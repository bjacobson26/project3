require 'rails_helper'


#### 18 PENDING TESTS
describe ProductsController do

  let :valid_attributes do 
    {
      name: "product1",
      unit_price: 10
    }
  end

  before(:each) do
    
    @product1 = Product.create(name:"product1", unit_price:10)
    @product1 = Product.create valid_attributes
    # @user2 = User.create(first_name: "Admin", last_name:"admin", admin: true, email:"admin@admin.com")
  end
# ==========================================
  describe "GET #index" do
    before(:each) do
      get :index
    end 
    it "renders the index template & response should be http status 200" do
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

# ==========================================
  describe "GET #new" do
    before(:each) do
      get :new
    end
    it "renders the new template with status 200" do
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end
  end

# ==========================================
end