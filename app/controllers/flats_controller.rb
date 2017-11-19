class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
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
    params.require(:flat).permit(:name, :address)
  end
end
