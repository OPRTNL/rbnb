class CabinsController < ApplicationController
  before_action :set_cabin, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @cabins = Cabin.search_by_name_description_and_localisation(params[:query])
      @cabins.empty? ? @cabins = Cabin.all : @cabins.near(params[:query], 1_000)
      map_set
    else
      @cabins = Cabin.all
      map_set
    end
  end

  # def top
  #   @top_cabins = Cabin.where(:rating >= 4.5)
  # end

  # def capacity
  #   @cabins_capacity_1 = Cabin.where(:capacity == 1)
  #   @cabins_capacity_2 = Cabin.where(:capacity == 2)
  #   @cabins_capacity_3 = Cabin.where(:capacity == 3)
  #   @cabins_capacity_4 = Cabin.where(:capacity == 4)
  # end

  # def destination
  #   @cabins_capacity_1 = Cabin.where(:capacity == 1)
  #   @cabins_capacity_2 = Cabin.where(:capacity == 2)
  #   @cabins_capacity_3 = Cabin.where(:capacity == 3)
  #   @cabins_capacity_4 = Cabin.where(:capacity == 4)
  # end

  def show
    @cabin = Cabin.find(params[:id])
    @bookings = @cabin.bookings
    @booking = Booking.new
  end

  def new
    @cabin = Cabin.new
  end

  def create
    @cabin = Cabin.new(cabin_params)
    @cabin.user = current_user
    if @cabin.save
      redirect_to cabins_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cabin.update!(user_params)
    redirect_to user_owned_cabin(@cabin)
  end

  def destroy
    # a rajouter dans le show alert('are your sure you want to destroy this cabin?')
    @cabin.destroy
    redirect_to user_owned_cabins
  end

  private

  def set_cabin
    @cabin = @cabins.find(params[:id])
  end

  def map_set
    @cabins = @cabins.where.not(latitude: nil, longitude: nil)

    @markers = @cabins.map do |cabin|
      {
        lng: cabin.longitude,
        lat: cabin.latitude
      }
    end
  end

  def cabin_params
    params.require(:cabin).permit(:name, :description, :rating, :daily_rate, :max_people, :picture, :kitchen, :lake, :hot_water, :wifi, :available, :address, :beach, :mountain)
  end
end
