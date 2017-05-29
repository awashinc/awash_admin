class Admin::CarManufacturersController < Admin::ApplicationController
  def index
    @car_manufacturers = CarManufacturer.page(params[:page]).per(30)
  end

 def show
   @car_manufacturer = CarManufacturer.find(params[:id])
 end

  def new
    @car_manufacturer = CarManufacturer.new
  end

  def create
    @car_manufacturer = CarManufacturer.new(car_manufacturer_params)
    if @car_manufacturer.save
      redirect_to admin_car_manufacturers_url, :notice => "Successfully created car manufacturer."
    else
      render :new
    end
  end

 def edit
   @car_manufacturer = CarManufacturer.find(params[:id])
 end

  def update
    @car_manufacturer = CarManufacturer.find(params[:id])
    if @car_manufacturer.update_attributes(car_manufacturer_params)
      redirect_to admin_car_manufacturers_url, :notice  => "Successfully updated car manufacturer."
    else
      render :edit
    end
  end

  def destroy
    @car_manufacturer = CarManufacturer.find(params[:id])
    @car_manufacturer.destroy
    redirect_to admin_car_manufacturers_url, :notice => "Successfully destroyed car manufacturer."
  end

  private
  def car_manufacturer_params
    params.require(:car_manufacturer).permit(:manufacturer_name, \
                                 car_manufacturer_images_attributes: [:id, :image, :sort, :_destroy])
  end
end
