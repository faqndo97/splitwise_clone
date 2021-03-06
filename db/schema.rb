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

ActiveRecord::Schema.define(version: 2020_04_04_003552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deptors_expenses", force: :cascade do |t|
    t.bigint "expense_id", null: false
    t.bigint "deptor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deptor_id"], name: "index_deptors_expenses_on_deptor_id"
    t.index ["expense_id"], name: "index_deptors_expenses_on_expense_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "payer_id", null: false
    t.string "name"
    t.float "amount"
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_expenses_on_group_id"
    t.index ["payer_id"], name: "index_expenses_on_payer_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.integer "category", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_groups_users_on_group_id"
    t.index ["user_id"], name: "index_groups_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "deptors_expenses", "expenses"
  add_foreign_key "deptors_expenses", "users", column: "deptor_id"
  add_foreign_key "expenses", "groups"
  add_foreign_key "expenses", "users", column: "payer_id"
  add_foreign_key "groups_users", "groups"
  add_foreign_key "groups_users", "users"
end
