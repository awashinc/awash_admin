class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include UserFunc

  default_scope -> { order("id desc") }
  scope :customers, -> { where("user_level < 30") }


  validates :email, uniqueness: true

  has_many :cars
  has_one :user_profile, dependent: :destroy

  has_many :washing_comments
  has_many :payments


  has_many :messages
  has_many :chats, through: :messages

  accepts_nested_attributes_for :user_profile, :cars,  allow_destroy: true

  after_create do |u|
    if u.user_profile.blank?
      u.create_user_profile
    end
  end

  def user_status_str
    to_status(self.user_status) 
  end

  def user_level_str
    to_level(self.user_level) 
  end

  def wash_offer_str
    to_wash_offer(self.wash_offer) 
  end

  def user_gender_str
    to_gender_str(self.user_profile.gender)
  end
end
