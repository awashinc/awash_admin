class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.integer :user_id, comment: "user id"
      t.integer :gender, comment: "man or woman", default: 0
      t.date :birth_date, comment: "birth date"
      t.string :come_from, comment: "come from (facebook, paper, 추천지인)"
      t.integer :is_married, comment: "married status", default: 0
      t.text :memo, comment: "more infomation"
      t.integer :have_kakao, comment: "have kakao", default: 0
      t.string :kakao_id, comment: "kakao_id"
      t.string :image, comment: "user image"

      t.timestamps
    end
  end
end
