class CarManufacturer < ApplicationRecord

  has_many :cars

  has_many :car_manufacturer_images

  accepts_nested_attributes_for :car_manufacturer_images, :allow_destroy => true 

end
