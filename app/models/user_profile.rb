class UserProfile < ApplicationRecord

  mount_uploader :image, AwashUploader

end
