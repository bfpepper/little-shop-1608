class Admin::TripsController < Admin::BaseController

  def index
    @trips = Trip.all
  end

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

  def edit
    @trip = Trip.find(params[:id])
    @categories = Category.all
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      flash[:success] = "Successfully updated #{@trip.title}!"
      redirect_to admin_trips_path
    else
      redirect_to edit_admin_trip_path(@trip, title: @trip.title)
    end
  end


  private

  def trip_params
    params.require(:trip).permit(:title, :description, :price, :image_url, :category, :retired)
  end

end
