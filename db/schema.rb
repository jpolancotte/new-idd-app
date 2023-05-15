# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_15_220052) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deal_stages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
  end

  create_table "deals", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "name"
    t.string "chain"
    t.bigint "deal_stage_id", null: false
    t.string "state"
    t.string "tte_servicing_pharmacy"
    t.string "total_residential_individuals"
    t.string "probability_of_close"
    t.date "go_live_date"
    t.string "incumbent_pharmacy"
    t.string "delivery_type"
    t.string "comments"
    t.string "pipeline_date"
    t.integer "forecasted_individuals"
    t.string "objectid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_stage_id"], name: "index_deals_on_deal_stage_id"
    t.index ["team_id"], name: "index_deals_on_team_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_type"
    t.string "object_id"
    t.string "event_id"
    t.string "occured_at"
    t.string "property_name"
    t.string "property_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "first"
    t.string "last"
    t.string "email"
    t.string "hs_user_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hs_deal_owner_number"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "refresh_token"
    t.string "access_token"
    t.datetime "expires_in"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tte_pharmacies", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "pharmid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "superadmin_role", default: false
    t.boolean "supervisor_role", default: false
    t.boolean "user_role", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "deals", "deal_stages"
  add_foreign_key "deals", "teams"
end
