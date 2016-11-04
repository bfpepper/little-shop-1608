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
    @cart.contents.each do |trip_id, count|
      trip = Trip.find(trip_id.to_i)
      OrdersTrip.create(order_id: @order.id, trip_id: trip_id.to_i, quantity: count, trip_price: trip.price)
    end
    session[:cart].clear

    flash[:success] = "Order was successfully placed!"
    redirect_to orders_url
  end

end
