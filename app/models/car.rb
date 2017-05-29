class Car < ApplicationRecord

  include DayFunc

  default_scope -> { order("id desc") }

  belongs_to :user
  belongs_to :car_manufacturer

  has_many :car_images, dependent: :destroy
  has_many :payments, dependent: :destroy

  accepts_nested_attributes_for :car_images, :allow_destroy => true 

  def owner_name
    self.user.try("username")
  end

  def owner_status
    self.user.try("user_status_str")
  end

  def owner_gender
    self.user.try("user_gender_str")
  end

  def owner_email
    "#{self.user.try("email")} (#{self.user.try("email1")})" if self.user.try("email1").present?
    self.user.try("email") if self.user.try("email1").blank?
  end

  def owner_phone
    self.user.try("phone")
  end

  def owner_kakao
    self.user.try("user_profile").try("kakao_id")
  end

  def short_spot
    self.spot.truncate(10) if self.spot.present?
  end

  def service_period
    "#{to_wday(self.service_day)} #{self.service_time} #{self.service_etc}".strip
  end


end
