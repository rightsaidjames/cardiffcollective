class UsersController < ApplicationController

  def index
    @users_letters = User.all.group_by { |u| u.name.first }.sort
  end

  def show
    @user = User.find(params[:id])
  end

  def me
    @user = current_user
    redirect_to @user
  end

end
