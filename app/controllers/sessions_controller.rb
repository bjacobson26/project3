class SessionsController < ApplicationController

  def new
  	# this is user b/c it's a session based on a user logging in
  	@user = User.new
  end

  def create
  	# find the user by email
  	u = User.where(email: params[:user][:email]).first
  	# if user has an email & password is authenticated...
  	if u != nil && u.authenticate(params[:user][:password])
  		# this saves the session as a cookie
  		session["user_id"] = u.id.to_s
      session["email"] = u.email.to_s
  		# go to user's cookie
      if u.admin == true
  		  redirect_to admin_path
      else 
        redirect_to root_path
      end
    else
       redirect_to new_sessions_path
  	end
  end

  def destroy
  	session.destroy
    redirect_to root_path
  end
end
