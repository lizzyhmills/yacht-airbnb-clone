class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @yachts = Yacht.all
    if params[:query].present? && params[:query].to_i == 0
      sql_subquery = "name ILIKE :query OR location ILIKE :query"
      @yachts = @yachts.where(sql_subquery, query: "%#{params[:query]}%")
    elsif params[:query].to_i != 0
      @yachts = @yachts.where(capacity: params[:query].to_i)
    end
  end

  def show
    @yacht = Yacht.find(params[:id])
    @user = current_user
    @booking = Booking.new
    @yacht_arr = Yacht.where(id: params[:id])
    @markers = @yacht_arr.geocoded.map do |yacht|
      {
        lat: yacht.latitude,
        lng: yacht.longitude,
      }
    end
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

  def edit
    @yacht = Yacht.find(params[:id])
  end

  def update
    @yacht = Yacht.find(params[:id])
    @yacht.update(yacht_params)
    if @yacht
      redirect_to yacht_path(@yacht)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @yacht = Yacht.find(params[:id])
    @yacht.destroy
    redirect_to mylistings_path, status: :see_other
  end

  private

  def yacht_params
    params.require(:yacht).permit(:capacity, :price_per_night, :name, :description, :location, :amenities, photos: [])
  end
end
