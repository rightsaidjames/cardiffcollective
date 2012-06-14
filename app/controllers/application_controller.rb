class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    @users = User.all
  end

end
