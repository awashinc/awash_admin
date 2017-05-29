class CreateWashings < ActiveRecord::Migration[5.0]
  def change
    create_table :washings do |t|
      t.integer :car_id, comment: "car id"
      t.integer :user_id, comment: "user id"
      t.integer :washer_id, comment: "main washer id"
      t.datetime :wash_date, comment: "washing date"
      t.text :washer_comment, comment: "main washer's comment(with who, etc)"
      t.string :service_part, comment: "service part (내외부, 외부)"
      t.string :service_time, comment: "service duration time"
      t.integer :is_inner_clean, comment: "Is Cleaning inner part", default: 0
      t.time :start_time, comment: "washing start Time"
      t.time :end_time, comment: "washing end Time"
      t.text :feedback, comment: "customer feedback"

      t.timestamps
    end
  end
end
