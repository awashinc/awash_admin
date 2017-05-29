class Washing < ApplicationRecord

  belongs_to :car
  belongs_to :user
  belongs_to :washer, foreign_key: :washer_id, :class_name => "User"

  has_many :washing_comments, dependent: :destroy

  include PictureUploader[:picture]

  def washer_name
    self.washer.try('username')
  end

  before_save do |wash|

    if wash.start_time.present? && wash.end_time.present? &&  wash.start_time_changed? && wash.end_time_changed?
      hour = ((wash.end_time - wash.start_time) / 3600 ).to_i.to_s.rjust(2, '0')
      minute = ((wash.end_time - wash.start_time) % 3600 / 60).to_i.to_s.rjust(2, '0')
      wash.service_time = hour + ":" + minute
    end

  end

end
