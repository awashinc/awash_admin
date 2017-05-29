class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, comment: "user name"
      t.string :phone, comment: "phone number"
      t.string :email, comment: "email address"
      t.string :email1, comment: "email sub address"
      t.integer :user_status, comment: "user current status (예비고객, 샵고객, 버틀러 등등)", default: 0
      t.integer :user_level, comment: "user access(00~99)", default: 1
      t.integer :wash_offer, comment: "economy, standard, etc", default: 0
      t.text :wash_offer_memo, comment: "wash offer text"

      t.timestamps
    end
  end
end
