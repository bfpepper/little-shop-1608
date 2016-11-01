class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    trip = Trip.find(params[:trip_id])
    @cart.add_trip(trip.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You have #{pluralize(@cart.count_of(trip.id), "#{trip.title} trip")} in your cart."
    redirect_to trips_path
  end

end
