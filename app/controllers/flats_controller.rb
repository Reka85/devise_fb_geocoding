class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @flats = Flat.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @flat_coordinates = { lat: @flat.latitude, lng: @flat.longitude }
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :zip_code, :city, :country)
  end
end
