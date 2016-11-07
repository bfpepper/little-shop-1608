class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @hash = Gmaps4rails.build_markers(@trip) do |trip, marker|
      marker.lat trip.latitude
      marker.lng trip.longitude
    end
  end

end
