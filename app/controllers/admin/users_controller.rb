module Admin
  class UsersController < AdminBaseController
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

    private
    def user_params
      params.require(:user).permit :name, :email, :password, :password_confirmation,
      :phone, :address, :permission
    end
  end
end
