module Admin
  class ToursController < AdminBaseController
    before_action :load_tour, only: %i(edit update destroy)

    def index
      @tours = Tour.all
    end

    def new
      @tour = Tour.new
    end

    def create
      @tour = Tour.create tour_params
      if @tour.save
        flash[:success] = t "admin.create.add_succ"
        redirect_to admin_tours_path
      else
        render :new
      end
    end

    def edit; end

    def update
      if @tour.update tour_params
        flash[:success] = t "admin.update.edit_succ"
        redirect_to admin_tours_path
      else
        render :edit
      end
    end

    def destroy
      if @tour.destroy
        flash[:success] = t "admin.destroy.delete_succ"
      else
        flash[:danger] = t "admin.destroy.delete_fail"
      end
      redirect_to admin_tours_path
    end

    private
    def tour_params
      params.require(:tour).permit :name, :departureDay, :duration, :money, :schedule,
      :picture
    end

    def load_tour
      @tour = Tour.find_by id: params[:id]
      return if @tour
      flash[:danger] = t "admin.edit.not_found"
      redirect_to admin_tours_path
    end
  end
end
