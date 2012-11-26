class UsersController < ApplicationController

  def index
    @users_letters = User.all.group_by { |u| u.name.first }.sort
    @learnings = User.tag_counts_on(:learning).sort_by(&:count).reverse.take(5)
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

  def contact
    if current_user
      to = User.find(params[:id])
      from = current_user
      UserMailer.contact_email(from, to, params[:message]).deliver
      redirect_to user_path(to), notice: "Your message to #{ to.name } was sent"
    end
  end

end
