class TripsController < ApplicationController

  def index
    if params[:override]
      @trips = params[:override].map { |trip| Trip.find(trip) }
    else
      @trips =  Trip.all
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @hash = @trip.get_coordinates
  end

  def search
    @trips = Trip.search(params[:search]).uniq
    unless URI(request.referer).path == root_path || URI(request.referer).path == trips_path
      redirect_to trips_path(override: @trips)
    end

    respond_to do |format|
      format.js
    end
  end

end
