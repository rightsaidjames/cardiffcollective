class UsersController < ApplicationController

  def index
    @users_letters = User.all.group_by { |u| u.name.first }.sort
  end

  def show
    @user = User.find(params[:id])
  end

  def me
    if current_user
      redirect_to current_user
    else
      redirect_to new_user_registration_path
    end
  end

end
