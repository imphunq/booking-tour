module Admin
  class UsersController < AdminBaseController
    before_action :load_user, only: %i(edit update destroy)
    before_action :check_admin, only: :destroy

    def index
      @users = User.select_column.page(params[:page]).per Settings.paginate_perpage
    end

    def new
      @user = User.new
    end

    def create
      @user = User.create user_params
      if @user.save
        flash[:success] = t "admin.users.create.add_succ"
        redirect_to admin_users_path
      else
        render :new
      end
    end

    def edit; end

    def update
      if @user.update user_params
        flash[:success] = t "admin.users.update.edit_succ"
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    def destroy
      if @user.destroy
        flash[:success] = t "admin.users.destroy.delete_succ"
      else
        flash[:danger] = t "admin.users.destroy.delete_fail"
      end
      redirect_to admin_users_path
    end

    private
    def user_params
      params.require(:user).permit :name, :email, :password, :password_confirmation,
      :phone, :address, :permission
    end

    def check_admin
      return unless @user.permission?
      flash[:danger] = t "admin.users.destroy.cannot_delete"
      redirect_to admin_users_path
    end

    def load_user
      @user = User.find_by id: params[:id]
      return if @user
      flash[:danger] = t "admin.users.edit.not_find"
      redirect_to admin_users_path
    end
  end
end
