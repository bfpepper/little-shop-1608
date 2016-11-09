class OrdersController < ApplicationController

  def index
  end

  def show
    @order = Order.find(params[:id])
    render file: 'public/404', layout: false unless current_user && current_user == @order.user
  end

  def new
  end

  def create
    @order = current_user.orders.create(cost: @cart.total_cost)
    @cart.place_order(@order)
    session[:cart].clear
    flash[:success] = "Order was successfully placed!"
    redirect_to orders_url
  end

  def change_status
    order = Order.find(params[:id])
    order.status = params[:status]
    order.save
    redirect_to admin_dashboard_path
  end

end
