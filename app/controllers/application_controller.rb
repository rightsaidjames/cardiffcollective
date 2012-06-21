class ApplicationController < ActionController::Base
  protect_from_forgery

  def tags
    @user = current_user
  end

end
