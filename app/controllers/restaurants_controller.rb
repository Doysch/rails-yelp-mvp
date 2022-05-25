class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy chef]

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1
  def show
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating, :phone_number)
  end
end
