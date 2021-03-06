class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_filter :authenticate_user!
  def all
    p env["omniauth.auth"]
    user = User.from_omniauth(env["omniauth.auth"], current_user)
    if user.persisted?
      sign_in_and_redirect(user)
    end
  end

  def failure
    #handle your logic here..
    #and delegate to super.
    super
  end

  alias_method :github, :all
  alias_method :linkedin, :all
end
