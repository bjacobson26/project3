require 'rails_helper'


#### 18 PENDING TESTS
describe UsersController do
  before(:each) do
    get :index
    # @user1 = User.create(first_name:"Colonal", last_name:"Mustard", email:"yellowstuff@gmail.com")
    # @user2 = User.create(first_name: "Admin", last_name:"admin", admin: true, email:"admin@admin.com")

  end

  describe "GET #index" do

    it "renders the index template" do

      expect(response).to render_template('index')
    end
    it "response should be http status 200" do

      expect(response).to have_http_status(200)
    end
    # it "assigns @users to include items" do
    #   expect(assigns(:users)).to include(@user1, @user2)
    # end
  end

  describe "GET #show" do
    it "renders the show template"
    it "assigns an item to @item"
  end

  describe "GET #new" do
    it "renders the new template with status 200 "
    it "makes a new Item"
    it "is not persisted"
  end

  describe "POST #create" do
    it "persists an item to the DB"
  end

  describe "GET #edit" do
    it "renders the edit template with status 200"
    it "should assign the item to @item"
  end

  describe "PUT/PATCH #update" do
    describe "with successful update" do
      it "should update the item record in the database"
      it "redirect to the show path for this item"
    end

    describe "with unsuccessful update" do
      describe "should not update the item record in the database" do
        it "if the item qty to 0"
        it "if the item name is nil"
        it "should redirect to the edit view template"
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes an item from the DB"
    it "redirects to index page"
  end
end