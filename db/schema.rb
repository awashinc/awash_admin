# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161109080331) do

  create_table "car_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "car_id",                  comment: "car id"
    t.string   "image",                   comment: "image"
    t.string   "comment",                 comment: "image desc"
    t.integer  "sort",                    comment: "sorting"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_manufacturer_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "car_manufacturer_id",              comment: "car_manufacturer_id"
    t.string   "image",                            comment: "image"
    t.string   "comment",                          comment: "image desc"
    t.integer  "sort",                             comment: "sorting"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "car_manufacturers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "manufacturer_name",              comment: "manufacturer name (bmw, audi)"
    t.string   "specific_name",                  comment: "specific anem(c350, a5, a4)"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "cars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "user_id",                                        comment: "customer user id"
    t.string   "car_name",                                       comment: "customer car name"
    t.string   "car_number",                                     comment: "customer car number"
    t.integer  "car_manufacturer_id",                            comment: "car manufacturer"
    t.string   "spot",                                           comment: "washing spot"
    t.text     "issue",               limit: 65535,              comment: "washing issues"
    t.integer  "service_day",                                    comment: "service day mon~ sun"
    t.string   "service_time",                                   comment: "service time (00:00 ~ 23:59)"
    t.string   "service_etc",                                    comment: "service time text"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.float    "latitude",            limit: 24
    t.float    "longitude",           limit: 24
  end

  create_table "chats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "title",                   comment: "Chatting Title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "chat_id",                               comment: "chat id"
    t.integer  "user_id",                               comment: "user id"
    t.text     "content",    limit: 65535,              comment: "message content"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "user_id",                                 null: false, comment: "user id"
    t.integer  "car_id",                                  null: false, comment: "car id"
    t.date     "payment_date",                                         comment: "recharge payment date"
    t.integer  "payment_price",               default: 0,              comment: "recharge price"
    t.integer  "current_price",               default: 0,              comment: "current price"
    t.text     "memo",          limit: 65535,                          comment: "add memo"
    t.integer  "parent_id",                   default: 0,              comment: "parent payment_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "user_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "user_id",                                           comment: "user id"
    t.integer  "gender",                   default: 0,              comment: "man or woman"
    t.date     "birth_date",                                        comment: "birth date"
    t.string   "come_from",                                         comment: "come from (facebook, paper, 추천지인)"
    t.integer  "is_married",               default: 0,              comment: "married status"
    t.text     "memo",       limit: 65535,                          comment: "more infomation"
    t.integer  "have_kakao",               default: 0,              comment: "have kakao"
    t.string   "kakao_id",                                          comment: "kakao_id"
    t.string   "image",                                             comment: "user image"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "username",                                                       comment: "user name"
    t.string   "phone",                                                          comment: "phone number"
    t.string   "email",                                                          comment: "email address"
    t.string   "email1",                                                         comment: "email sub address"
    t.string   "encrypted_password",                   default: "", null: false
    t.integer  "user_status",                          default: 0,               comment: "user current status (예비고객, 샵고객, 버틀러 등등)"
    t.integer  "user_level",                           default: 1,               comment: "user access(00~99)"
    t.integer  "wash_offer",                           default: 0,               comment: "economy, standard, etc"
    t.text     "wash_offer_memo",        limit: 65535,                           comment: "wash offer text"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "washing_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "washing_id",                            comment: "washing id"
    t.integer  "user_id",                               comment: "commenting user id"
    t.text     "comment",    limit: 65535,              comment: "comment text"
    t.string   "image",                                 comment: "image"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "washings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "car_id",                                                comment: "car id"
    t.integer  "user_id",                                               comment: "user id"
    t.integer  "washer_id",                                             comment: "main washer id"
    t.datetime "wash_date",                                             comment: "washing date"
    t.text     "washer_comment", limit: 65535,                          comment: "main washer's comment(with who, etc)"
    t.string   "service_part",                                          comment: "service part (내외부, 외부)"
    t.string   "service_time",                                          comment: "service duration time"
    t.integer  "is_inner_clean",               default: 0,              comment: "Is Cleaning inner part"
    t.time     "start_time",                                            comment: "washing start Time"
    t.time     "end_time",                                              comment: "washing end Time"
    t.text     "feedback",       limit: 65535,                          comment: "customer feedback"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

end
