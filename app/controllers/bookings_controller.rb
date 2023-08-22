class BookingsController < ApplicationController
  before_action :set_yacht, only: %i[new create]
  before_action :set_user, only: %i[new create]
  def index
    @bookings = Booking.all
  end

  def new

    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.yacht = @yacht
    @booking.user = @user
    if @booking.save
      redirect_to mybookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_yacht
    @yacht = Yacht.find(params[:yacht_id])
  end

  def set_user
    @user = current_user
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :guests)
  end
end
