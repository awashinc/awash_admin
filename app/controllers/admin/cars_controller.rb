class Admin::CarsController < Admin::ApplicationController
  def index
    @cars = Car.page(params[:page]).per(20)
  end

 def show
   @car = Car.find(params[:id])
 end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to admin_cars_url, :notice => "Successfully created car."
    else
      render :new
    end
  end

 def edit
   @car = Car.find(params[:id])
 end

  def update
    @car = Car.find(params[:id])
    if @car.update_attributes(car_params)
      redirect_to admin_cars_url, :notice  => "Successfully updated car."
    else
      render :edit
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to admin_cars_url, :notice => "Successfully destroyed car."
  end

  private
  def car_params
    params.require(:car).permit(:user_id, :car_name, :car_number, :car_manufacturer_id, :spot, :service_day, :service_time, :service_etc, :issue,\
                                :latitude, :longitude, \
                                 car_images_attributes: [:id, :image, :sort, :_destroy])
  end
end
