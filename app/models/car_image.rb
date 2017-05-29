class CarImage < ApplicationRecord

  belongs_to :car

  mount_uploader :image, AwashUploader

end
