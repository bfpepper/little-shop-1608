class Admin::TripsController < Admin::BaseController

  def new
    @trip = Trip.new
    @categories = Category.all
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to admin_dashboard_path
    else
      @categories = Category.all
      redirect_to new_admin_trip_path
    end
  end


  private

  def trip_params
    params.require(:trip).permit(:title, :description, :price, :image_url, :category)
  end

end
