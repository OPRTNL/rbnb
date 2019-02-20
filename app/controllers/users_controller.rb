class UsersController < ApplicationController

  before_action :set_user

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user.update!(user_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :phone_number, :profile_pic)
  end

end
