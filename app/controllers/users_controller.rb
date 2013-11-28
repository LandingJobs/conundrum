class UsersController < ApplicationController
  skip_before_filter :authenticate_user!

  def sign_in
  end
end
