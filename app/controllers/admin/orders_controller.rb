module Admin
  class OrdersController < AdminBaseController
    def index
      @orders = Order.select_col.page(params[:page]).per Settings.paginate_perpage
    end

    def destroy
      @order = Order.find_by id: params[:id]
      if @order.destroy
        flash[:success] = t "admin.destroy.delete_succ"
      else
        flash[:danger] = t "admin.destroy.delete_fail"
      end
      redirect_to admin_orders_path
    end

    private
    def count_number index, page
      per_page = Settings.paginate_perpage
      count = (page-1)*per_page + index
    end
    helper_method :count_number
  end
end
