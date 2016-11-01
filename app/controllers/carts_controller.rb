class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    trip = Trip.find(params[:trip_id])
    @cart.add_trip(trip.id)
    session[:cart] = @cart.contents
    flash[:success] = "You have #{pluralize(@cart.count_of(trip.id), "#{trip.title} trip")} in your cart."
    redirect_to trips_path
  end

  def show
  end

  def remove
    @cart.remove(params[:trip_id].to_s)
    session[:cart] = @cart.contents
    redirect_to cart_path
  end

  def update
    @cart.update(params[:trip_id].to_s, params[:quantity])
    session[:cart] = @cart.contents
    redirect_to cart_path
  end

end
