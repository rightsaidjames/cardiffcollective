class UsersController < ApplicationController

  def index
    @users = User.all
    @users_letters = @users.group_by { |u| u.name.first }
  end

  def show
    @user = User.find(params[:id])
  end

end
