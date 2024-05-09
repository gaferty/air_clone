class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.venue = Venue.find(params[:venue_id])
    @booking.save
    redirect_to bookings_path
  end

  def update_acceptance
    @booking = Booking.find(params[:id])
    @booking.update(accepted: !@booking.accepted)
    @booking.save
    redirect_to booking_path(@booking)
  end

  def my_venues
    @my_venues = Venue.where(user_id: current_user.id)
    @bookings=Booking.where(venue_id: @my_venues)

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :venue_id)
  end

end
