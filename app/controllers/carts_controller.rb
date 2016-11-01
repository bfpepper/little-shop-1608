class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    trip = Trip.find(params[:trip_id])
    @cart.add_trip(trip.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You have #{pluralize(@cart.count_of(trip.id), "#{trip.title} trip")} in your cart."
    redirect_to trips_path
  end

  def show
    @trips_count = @cart.contents.reduce({}) do |result, trip|
      result[Trip.find(trip[0].to_i)] = trip[1]
      result
    end
    @total = 0
    @trips_count.each do |trip, count|
      @total += (trip.price * count)
    end
  end

end
