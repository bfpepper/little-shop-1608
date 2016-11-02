class OrdersController < ApplicationController

  def index
  end

  def new
  end

  def create
    @order = current_user.orders.create
    @cart.contents.each do |trip_id, count|
      OrdersTrip.create(order_id: @order.id, trip_id: trip_id.to_i, quantity: count)
    end
    flash[:success] = "Thank you for your order!"
    redirect_to orders_url
  end

end
