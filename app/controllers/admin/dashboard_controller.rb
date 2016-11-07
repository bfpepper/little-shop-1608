class Admin::DashboardController < Admin::BaseController

  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def change_status
    if params[:status]
      @orders = Order.where(status: params[:status]).order(created_at: :desc)
    else
      @orders = Order.all.order(created_at: :desc)
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
