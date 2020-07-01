# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_29_214459) do

  create_table "allocations", force: :cascade do |t|
    t.integer "collaborator_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collaborator_id"], name: "index_allocations_on_collaborator_id"
    t.index ["product_id"], name: "index_allocations_on_product_id"
  end

  create_table "collaborators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "registration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "descriptions", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "model"
    t.string "serie_number"
    t.string "warranty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "situation", default: 0
    t.integer "memory"
    t.integer "hard_drive"
    t.integer "operational_system"
    t.index ["product_id"], name: "index_descriptions_on_product_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "manufacturer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manufacturer_id"], name: "index_products_on_manufacturer_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "collaborator_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "description_id", null: false
    t.index ["collaborator_id"], name: "index_reservations_on_collaborator_id"
    t.index ["description_id"], name: "index_reservations_on_description_id"
    t.index ["product_id"], name: "index_reservations_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "allocations", "collaborators"
  add_foreign_key "allocations", "products"
  add_foreign_key "descriptions", "products"
  add_foreign_key "products", "manufacturers"
  add_foreign_key "reservations", "collaborators"
  add_foreign_key "reservations", "descriptions"
  add_foreign_key "reservations", "products"
end
