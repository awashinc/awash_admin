class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.integer :user_id, comment: "customer user id"
      t.string :car_name, comment: "customer car name"
      t.string :car_number, comment: "customer car number"
      t.integer :car_manufacturer_id, comment: "car manufacturer"
      t.string :spot, comment: "washing spot"
      t.text :issue, comment: "washing issues"
      t.integer :service_day, comment: "service day mon~ sun"
      t.string :service_time, comment: "service time (00:00 ~ 23:59)"
      t.string :service_etc, comment: "service time text"

      t.timestamps
    end
  end
end
