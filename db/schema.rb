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

ActiveRecord::Schema.define(version: 20180922061411) do

  create_table "adjustments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "adjustable_type"
    t.bigint "adjustable_id"
    t.decimal "amount", precision: 8, scale: 2
    t.boolean "eligible", default: true
    t.string "source"
    t.bigint "register_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adjustable_type", "adjustable_id"], name: "index_adjustments_on_adjustable_type_and_adjustable_id"
    t.index ["register_id"], name: "index_adjustments_on_register_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.string "name"
    t.bigint "rule_id"
    t.timestamp "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_coupons_on_product_id"
    t.index ["rule_id"], name: "index_coupons_on_rule_id"
  end

  create_table "credits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "user_type"
    t.bigint "user_id"
    t.decimal "amount", precision: 8, scale: 2
    t.boolean "eligible", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_type", "user_id"], name: "index_credits_on_user_type_and_user_id"
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.bigint "register_id"
    t.bigint "category_id"
    t.integer "quantity", null: false
    t.decimal "item_price", precision: 8, scale: 2, null: false
    t.decimal "final_price", precision: 8, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["product_id"], name: "index_items_on_product_id"
    t.index ["register_id"], name: "index_items_on_register_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
    t.bigint "category_id"
    t.text "description"
    t.decimal "price", precision: 8, scale: 2
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.integer "count_on_hand", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "promotions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "promotable_type"
    t.bigint "promotable_id"
    t.string "name"
    t.timestamp "expires_at"
    t.bigint "rule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotable_type", "promotable_id"], name: "index_promotions_on_promotable_type_and_promotable_id"
    t.index ["rule_id"], name: "index_promotions_on_rule_id"
  end

  create_table "registers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "item_total", precision: 8, scale: 2, default: "0.0", null: false
    t.decimal "total", precision: 8, scale: 2, default: "0.0", null: false
    t.string "state"
    t.decimal "adjustment_total", precision: 8, scale: 2, default: "0.0", null: false
    t.bigint "user_id"
    t.datetime "completed_at"
    t.decimal "payment_total", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_registers_on_user_id"
  end

  create_table "rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "description"
    t.string "action"
    t.integer "action_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_classifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "age"
    t.string "type"
    t.integer "user_classification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
