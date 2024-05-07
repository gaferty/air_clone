class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venues = Venue.find(params[:id])
  end

end
