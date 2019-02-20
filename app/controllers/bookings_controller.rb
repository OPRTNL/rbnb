class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @cabin = Cabin.find(params[:cabin_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.cabin = @cabin
    @booking.save!
    redirect_to user_owned_booking(@booking)
  end

  def edit
  end

  def update
    @booking.update!(user_params)
    redirect_to user_owned_booking(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to user_owned_bookings
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end
end
