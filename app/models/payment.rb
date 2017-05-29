class Payment < ApplicationRecord

  belongs_to :user
  belongs_to :car

  has_one :child, :class_name => "Payment"
  belongs_to :parent, :class_name => "Payment", optional: true


  before_create do |pay|
    user = pay.user
    parent = user.payments.last
    if parent.present?
      pay.parent = parent
      pay.current_price += parent.current_price + pay.payment_price
    end


  end

end
