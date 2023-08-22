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

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(request: true)
    redirect_to mylistings_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.update(request: false)
    redirect_to mylistings_path
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
