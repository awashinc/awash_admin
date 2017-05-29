class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :user_id, comment: "user id", null: false
      t.integer :car_id, comment: "car id",  null: false
      t.date :payment_date, comment: "recharge payment date"
      t.integer :payment_price, comment: "recharge price", default: 0
      t.integer :current_price, comment: "current price", default: 0
      t.text :memo, comment: "add memo"
      t.integer :parent_id, comment: "parent payment_id", default: 0

      t.timestamps
    end
  end
end
