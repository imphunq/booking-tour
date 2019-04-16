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

ActiveRecord::Schema.define(version: 2019_04_11_161404) do

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.integer "status"
    t.bigint "tours_id"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tours_id"], name: "index_comments_on_tours_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "hotels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.bigint "tours_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tours_id"], name: "index_locations_on_tours_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "tours_id"
    t.float "money"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tours_id"], name: "index_orders_on_tours_id"
    t.index ["users_id"], name: "index_orders_on_users_id"
  end

  create_table "rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "users_id"
    t.bigint "tours_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tours_id"], name: "index_rates_on_tours_id"
    t.index ["users_id"], name: "index_rates_on_users_id"
  end

  create_table "sales", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tours_id"
    t.integer "sale_of"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tours_id"], name: "index_sales_on_tours_id"
  end

  create_table "tours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.date "departureDay"
    t.integer "duration"
    t.float "money"
    t.text "schedule"
    t.bigint "hotels_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotels_id"], name: "index_tours_on_hotels_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.datetime "birth"
    t.string "gender"
    t.string "address"
    t.string "phone"
    t.boolean "permission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "tours", column: "tours_id"
  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "locations", "tours", column: "tours_id"
  add_foreign_key "orders", "tours", column: "tours_id"
  add_foreign_key "orders", "users", column: "users_id"
  add_foreign_key "rates", "tours", column: "tours_id"
  add_foreign_key "rates", "users", column: "users_id"
  add_foreign_key "sales", "tours", column: "tours_id"
  add_foreign_key "tours", "hotels", column: "hotels_id"
end
