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
    if current_user.nil?
      redirect_to cabin_path(Cabin.find(params[:cabin_id])), :flash => { error: "Please register to book a cabin" }
    else
      @cabin = Cabin.find(params[:cabin_id])
      @booking = Booking.new(booking_params)
      if book_ok?
        if book_valid?
          @booking.user = current_user
          @booking.cabin = @cabin
          @booking.save
          redirect_to bookings_path
        else
        redirect_to cabin_path(@cabin), :flash => { error: "Invalid dates" }
        end
      else
        redirect_to cabin_path(@cabin), :flash => { error: "The cabin is already booked on these dates please try again" }
      end
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

  def book_valid?
    @booking.check_in < @booking.check_out
  end

  def book_ok?
    @cabin.bookings.count == @cabin.bookings.where("check_out < ? OR check_in > ?", @booking.check_in, @booking.check_out).count
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end
end

# Booking.where(:check_out < aa.check_in || :check_in > aa.check_out).count
