class CreateCarManufacturerImages < ActiveRecord::Migration[5.0]
  def change
    create_table :car_manufacturer_images do |t|
      t.integer :car_manufacturer_id, comment: "car_manufacturer_id"
      t.string :image, comment: "image"
      t.string :comment, comment: "image desc"
      t.integer :sort, comment: "sorting"

      t.timestamps
    end
  end
end
