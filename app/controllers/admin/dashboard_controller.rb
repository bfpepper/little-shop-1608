class Admin::DashboardController < Admin::BaseController

  def index
    if params[:status]
      @orders = Order.where(status: params[:status]).order(created_at: :desc)
    else
      @orders = Order.all.order(created_at: :desc)
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
