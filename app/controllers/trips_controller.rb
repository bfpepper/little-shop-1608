class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find_by(title: params[:title].capitalize)
  end
end
