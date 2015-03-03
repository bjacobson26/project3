class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	  @user = User.new
  end

  def create
  		# no need for it to be an instance variable (have an @), b/c we're not rendering a view
  	  user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
  	  if user.save
  	  	  session["user_id"] = user.id.to_s
  	  	  redirect_to root_path
  	  	else 
  	  		render 'new'
  	  end
  end

  def show
    @user = User.where(id: params[:id]).first      
      if @user != nil
      else
       #redirects user to new session path if no user is logged in
       redirect_to new_sessions_path 
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
      redirect_to user(current_user)
    else
      render 'edit'
    end
  end

  def admin
  end
end

