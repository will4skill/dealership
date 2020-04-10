class CarsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

def index
  @cars = Car.all
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
  @car = Car.new(Car_params)

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
  @Car = car.find(params[:id])

  if @car.update(car_params)
    redirect_to @Car
  else
    render 'edit'
  end
end

private
  def car_params
    params.require(:car).permit(:price, :new, :year, :maker, :color, :model, :mileage)
  end
end
