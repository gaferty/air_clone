class BookingsController < ApplicationController

  def index
    @bookings= Booking.where(user_id: 2)
  end

  def show

  end

end
