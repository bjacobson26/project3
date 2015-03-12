class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email])
    if @user
      @user.send_password_reset_email
      redirect_to new_password_reset_path
      flash[:notice] = "Email sent with password reset instructions"
    else
      flash[:notice] = 'Email sent with password reset instructions'
    end
  end

  def edit

  end

  def update
    if password_blank?
      render 'edit'
    elsif @user.update_attributes(user_params)
      redirect_to new_sessions_path
      flash[:alert] = "Password has been reset."
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # Returns true if password is blank.
  def password_blank?
    params[:user][:password].blank?
  end

  # Before filters
  def get_user
    @user = User.find_by(id: params[:id])
  end

  # Confirms a valid user.
  def valid_user
    unless (@user)
      raise @user.inspect
    end
  end

  # Checks expiration of reset token.
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end
end
