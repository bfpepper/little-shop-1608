class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    deparameterize
    @trip = Trip.find_by(title: params[:title])
  end

end
