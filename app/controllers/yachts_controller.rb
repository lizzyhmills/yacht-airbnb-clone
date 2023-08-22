class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @yachts = Yacht.all
  end

  def show
    @yacht = Yacht.find(params[:id])
    @user = current_user
    @booking = Booking.new
  end

  def new
    @yacht = Yacht.new
  end

  def create
    @user = current_user
    @yacht = Yacht.new(yacht_params)
    @yacht.user = @user
    if @yacht.save
      redirect_to mylistings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def yacht_params
    params.require(:yacht).permit(:capacity, :price_per_night, :name, :description, :location, :amenities)
  end
end
