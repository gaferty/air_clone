class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venues = Venue.find(params[:id])
    @booking = Booking.new(venue: @venues)
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user_id = current_user.id
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location, :capacity, :user_id, :venue_type, :details)
  end

end
