class WashingComment < ApplicationRecord

  belongs_to :user
  belongs_to :washing

  mount_uploader :image, AwashUploader

  def commentor_name
    user.username
  end

end
