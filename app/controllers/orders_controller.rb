class OrdersController < ApplicationController
  def create
    @order = Order.create order_params
    @user ||= current_user
    mail = params[:email]
    if @order.save
      UserMailer.order_email(@order, @user, mail).deliver_now
      flash[:success] = "Booking tour succsess, please check out email"
      redirect_to location_path @order.location_id
    else
      redirect_to root_path
    end
  end

  def index
    @user = current_user
    @orders = Order.filter_by_user_id @user
  end

  def destroy
    @order = Order.find_by id: params[:id]
    @order.destroy
    respond_to do |format|
      format.html {redirect_to orders_path, notice: "Order was succsessfully destroyed"}
      format.json {head :no_content}
      format.js {render layout: false}
    end
  end

  private
  def order_params
    params.require(:order).permit :quantity, :money, :user_id, :location_id
  end
end
