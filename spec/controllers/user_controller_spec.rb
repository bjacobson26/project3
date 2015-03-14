require 'rails_helper'


#### 18 PENDING TESTS
describe UsersController do

  let :valid_attributes do 
    {
      first_name: "firstname",
      last_name: "lastname",
      email: "example@email.com",
      password: "password"
    }
  end

  before(:each) do
    
    @user1 = User.create(first_name:"Colonel", last_name:"Mustard", email:"yellowstuff@gmail.com", password:"Guldens")
    @user1 = User.create valid_attributes
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
  describe "GET #show" do
    before(:each) do
      # See what validations didn't succeed 
      # puts @user1.errors.inspect
      get :show, id: @user1.id
    end
    it "renders the show template and should be http status 200" do 
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
    it "assigns a user to @user1" do 
      expect(assigns(:user)).to eq(@user1)
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
  describe "POST #create" do
    before(:each) do
      User.destroy_all
      @user_count = User.count
      get :create, {user:{first_name: "firstname", last_name: "lastname", email: "example@email.com", password: "password"}}
    end
    it "persists an item to the DB" do
      expect(User.count).to eq(@user_count + 1)
    end
  end
# ==========================================
  describe "GET #edit" do
    before(:each) do
      get :edit, {id: @user1.id, first_name: "firstname2", last_name: "lastname2"}
    end
    it "renders the new template with status 200" do
      expect(response).to have_http_status(200)
    end
  end
end