class UsersController < ApplicationController
  before_action :find_user, only: %i(show edit update)

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

  def show; end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "controllers.users_controller.update_succ"
      redirect_to edit_user_path
    else
      flash[:danger] =  t "controllers.users_controller.update_fail"
      render :edit
    end
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "controllers.users_controller.find_fail"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit :name, :password, :password_confirmation, :email,
    :phone, :birth, :address
  end
end
