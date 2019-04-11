module Admin
  class SalesController < AdminBaseController
    before_action :load_sale, only: %i(destroy edit update)

    def index
      @sales = Sale.all.page(params[:page]).per Settings.paginate_perpage
    end

    def new
      @sale = Sale.new
    end

    def create
      @sale = Sale.create sale_params
      if @sale.save
        flash[:success] = t "admin.create.add_succ"
        redirect_to admin_sales_path
      else
        render :new
      end
    end

    def edit; end

    def update
      if @sale.update sale_params
        flash[:success] = t "admin.update.edit_succ"
        redirect_to admin_sales_path
      else
        render :edit
      end
    end

    def destroy
      if @sale.destroy
        flash[:success] = t "admin.destroy.delete_succ"
      else
        flash[:danger] = t "admin.destroy.delete_fail"
      end
      redirect_to admin_sales_path
    end


    private
    def sale_params
      params.require(:sale).permit :sale_of, :tour_id
    end

    def load_sale
      @sale = Sale.find_by id: params[:id]
      return if @sale
      flash[:danger] = t "admin.edit.not_found"
      redirect_to admin_sales_path
    end

    def count_number index, page
      per_page = Settings.paginate_perpage
      count = (page-1)*per_page + index
    end
    helper_method :count_number
  end
end
