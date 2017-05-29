class CarManufacturerImage < ApplicationRecord

  belongs_to :car_manufacturer


  mount_uploader :image, AwashUploader

end
