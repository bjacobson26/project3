class SessionsController < ApplicationController
  def new
  	# this is user b/c it's a session based on a user logging in
  	@user = User.new
    if params[:user_created] == 'true'
      @user_created_message = 'User successfully created!'
    end
  end

  def create
  	# find the user by email
  	u = User.where(email: params[:user][:email]).first
  	# if user has an email & password is authenticated...
  	if u != nil && u.authenticate(params[:user][:password])
  		# this saves the session as a cookie
  		session["user_id"] = u.id.to_s
  		# go to user's cookie
  		redirect_to user_path(p)
    else 
      redirect_to user_path
  	end
  end

  def destroy
  	session.destroy
    redirect_to new_sessions_path
  end
end
