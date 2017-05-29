class CreateWashingComments < ActiveRecord::Migration[5.0]
  def change
    create_table :washing_comments do |t|
      t.integer :washing_id, comment: "washing id"
      t.integer :user_id, comment: "commenting user id"
      t.text :comment, comment: "comment text"
      t.string :image, comment: "image"

      t.timestamps
    end
  end
end
