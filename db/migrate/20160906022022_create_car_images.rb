class CreateCarImages < ActiveRecord::Migration[5.0]
  def change
    create_table :car_images do |t|
      t.integer :car_id, comment: "car id"
      t.string :image, comment: "image"
      t.string :comment, comment: "image desc"
      t.integer :sort, comment: "sorting"

      t.timestamps
    end
  end
end
