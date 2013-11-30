class UsersController < ApplicationController
  before_filter :authenticate_user!, only:[:show]

  def sign_in
  end

  def show
  end
end
