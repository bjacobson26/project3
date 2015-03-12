class UserMailer < ActionMailer::Base
  default from: "scottmeskilldesignswebsite@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user_id)
    @name = User.find(user_id).first_name
    @email = User.find(user_id).email
    @greeting = "Hi"

    mail to: @email do |format|
      format.text
      format.html
      end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user_id)
    @user = User.find(user_id)
    @email = @user.email
    mail to: @email, subject: "Password reset"
  end
end
