class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
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

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def my_venues
    @venues= Venue.where(user_id: current_user.id)

  end

  def list
    @venue = Venue.find(params[:id])
    @venue.update(available: !@venue.available)
    @venue.save
    redirect_to venue_path(@venue)
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to venues_my_venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location, :capacity, :user_id, :venue_type, :details, :photo)
  end

end
