module Admin
  class LocationsController < AdminBaseController
    before_action :load_location, only: %i(edit update destroy)

    def new
      @location = Location.new
    end

    def index
      @locations = Location.select_column.page(params[:page]).per Settings.paginate_perpage
    end

    def create
      @location = Location.create location_params
      if @location.save
        flash[:success] = t "admin.create.add_succ"
        redirect_to admin_locations_path
      else
        render :new
      end
    end

    def edit
      @location = Location.find_by id: params[:id]
    end

    def update
      @location = Location.find_by id: params[:id]
      if @location.update location_params
        flash[:success] = t "admin.update.edit_succ"
        redirect_to admin_locations_path
      else
        render :edit
      end
    end

    def destroy
      @location = Location.find_by id: params[:id]
      if @location.destroy
        flash[:success] = t "admin.destroy.delete_succ"
      else
        flash[:danger] = t "admin.destroy.delete_fail"
      end
      redirect_to admin_locations_path
    end

    private
    def location_params
      params.require(:location).permit :name, :address, :description, :tour_id, :picture
    end

    def load_location
      @location = Location.find_by id: params[:id]
      return if @location
      flash[:danger] = t "admin.edit.not_found"
      redirect_to admin_locations_path
    end

    def count_number index, page
      per_page = Settings.paginate_perpage
      count = (page-1)*per_page + index
    end
    helper_method :count_number
  end
end
