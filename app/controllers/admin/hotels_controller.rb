module Admin
  class HotelsController < AdminBaseController
    before_action :hotel_params, only: %i(create update)
    before_action :find_hotel, only: %i(edit update destroy)

    def index
      @hotel = Hotel.all.page(params[:page]).per(5)
    end

    def new
      @hotel = Hotel.new
    end

    def create
      @hotel = Hotel.create hotel_params
      if @hotel.save
        flash[:success] = t "admin.create.create_hotel"
        redirect_to admin_hotels_path
      else
        render :new
      end
    end

    def edit; end

    def update
      if @hotel.update hotel_params
        flash[:success] = t "admin.update.edit_succ"
        redirect_to admin_hotels_path
      else
        render :edit
      end
    end

    def destroy
      if @hotel.destroy
        flash[:success] = t "admin.destroy.delete_succ"
      else
        flash[:danger] = t "admin.destroy.delete_fail"
      end
      redirect_to admin_hotels_path
    end

    private
    def hotel_params
      params.require(:hotel).permit :name, :address, :phone
    end

    def find_hotel
      @hotel = Hotel.find_by id: params[:id]
      return if @hotel
      flash[:danger] = "Cannot find hotel"
      redirect_to admin_hotels_path
    end
  end
end
