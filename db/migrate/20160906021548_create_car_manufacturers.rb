class CreateCarManufacturers < ActiveRecord::Migration[5.0]
  def change
    create_table :car_manufacturers do |t|
      t.string :manufacturer_name, comment: "manufacturer name (bmw, audi)"
      t.string :specific_name, comment: "specific anem(c350, a5, a4)"

      t.timestamps
    end
  end
end
