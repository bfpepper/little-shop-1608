class OrdersController < ApplicationController

  def index
  end

  def new
  end

  def create
    @order = current_user.orders.new
    if @order.save
      flash[:success] = "Thank you for your order!"
      redirect_to orders_url
    else
      flash[:danger] = "Order failed. Please try again."
      render :new
    end
  end

end
