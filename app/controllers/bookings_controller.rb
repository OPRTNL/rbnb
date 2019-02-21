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
    abooking_count = @cabin.bookings.where("check_out < ? OR check_in > ?", @booking.check_in, @booking.check_out).count
    allbooking_count = @cabin.bookings.count
    if abooking_count != allbooking_count
      raise
    else
      @booking.check_in > @booking.check_out ? raise : true
      @booking.user = current_user
      @booking.cabin = @cabin
      @booking.save!
      redirect_to bookings_path
    end
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

# Booking.where(:check_out < aa.check_in || :check_in > aa.check_out).count
