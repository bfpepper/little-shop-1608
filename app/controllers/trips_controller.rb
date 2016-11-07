class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    deparameterize
    @trip = Trip.find_by(title: params[:title])
    @hash = Gmaps4rails.build_markers(@trip) do |trip, marker|
      marker.lat trip.latitude
      marker.lng trip.longitude
    end
  end

end
