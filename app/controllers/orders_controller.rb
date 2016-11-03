class OrdersController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    @order = current_user.orders.create
    @cart.contents.each do |trip_id, count|
      trip = Trip.find(trip_id.to_i)
      OrdersTrip.create(order_id: @order.id, trip_id: trip_id.to_i, quantity: count, trip_price: trip.price)
    end
    session[:cart].clear

    flash[:success] = "Thank you for your order!"
    redirect_to orders_url
  end

end
