class CarsController < ApplicationController
  before_action :confirm_logged_in, except: [:index, :show, :search]

  def search
  end

  def index
    @cars = Car.search_by_params(params[:price], params[:new], params[:year], params[:maker], params[:color], params[:model], params[:mileage])
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car
    else
      render 'new'
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    redirect_to cars_path
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to @car
    else
      render 'edit'
    end
  end

  private
    def car_params
      params.require(:car).permit(:price, :new, :year, :maker, :color, :model, :mileage)
    end

    def confirm_logged_in
      if session[:username] != 'Admin'
        flash[:danger] = "Login Required"
        redirect_to login_path
      end
    end
end
