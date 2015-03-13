class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	  @user = User.new
  end

  def create
  	  @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
      puts User.count
      if @user.save
          puts User.count
          UserMailer.welcome(@user.id).deliver
          u = User.where(email:params[:user][:email]).first
  	  	  session["user_id"] = u.id.to_s
          session["user_email"] = u.email.to_s
          if u.admin
            redirect_to admin_path
          else
  	  	   redirect_to root_path
          end
  	  	else 
  	  		redirect_to new_sessions_path
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

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name,:password,:password_confirmation,:image,:email, :admin)
  end
end

