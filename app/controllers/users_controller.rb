class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".regis_success"
      redirect_to signup_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :password, :password_confirmation,
    :email, :phone
  end
end
