class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_trip, only: [:create, :remove]

  def create
    @cart.add_trip(@trip.id)
    session[:cart] = @cart.contents
    flash[:success] = "You have #{pluralize(@cart.count_of(@trip.id), "#{@trip.title} trip")} in your cart."
    return_to_referrer(@trip)
  end

  def show
  end

  def remove
    @cart.remove(params[:trip_id].to_s)
    session[:cart] = @cart.contents
    flash[:success] = "Successfully removed #{view_context.link_to @trip.title, @trip} from cart."
    redirect_to cart_path
  end

  def update
    @cart.update(params[:trip_id].to_s, params[:quantity])
    session[:cart] = @cart.contents
    redirect_to cart_path
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def return_to_referrer(trip)
    if request.env["HTTP_REFERER"].include?("/trips/")
      redirect_to trip_path(trip)
    else
      redirect_to trips_path
    end
  end
end
