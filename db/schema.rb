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

ActiveRecord::Schema[7.0].define(version: 2024_02_15_233534) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "company_taxonomies", force: :cascade do |t|
    t.bigint "npi_company_id", null: false
    t.bigint "taxonomy_id", null: false
    t.string "state_iso"
    t.string "license"
    t.boolean "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npi_company_id"], name: "index_company_taxonomies_on_npi_company_id"
    t.index ["taxonomy_id"], name: "index_company_taxonomies_on_taxonomy_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "facid"
    t.string "pharmid"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "fac_admin_phone"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["facid"], name: "index_customers_on_facid", unique: true
  end

  create_table "deal_stages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
  end

  create_table "deals", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "dealname"
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
    t.boolean "remove"
    t.integer "number_of_delivery_locations"
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
    t.bigint "deal_id", null: false
    t.bigint "pipeline_activity_id"
    t.index ["deal_id"], name: "index_events_on_deal_id"
    t.index ["pipeline_activity_id"], name: "index_events_on_pipeline_activity_id"
  end

  create_table "hs_contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "hs_number"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "tte_customer"
    t.string "contact_owner"
    t.string "company_type"
    t.string "company_name"
    t.string "primay_identifier"
    t.decimal "latitude", precision: 13, scale: 9
    t.decimal "longitude", precision: 13, scale: 9
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job_title"
    t.string "contact_city"
    t.string "contact_state"
    t.string "company_address"
    t.string "company_city"
    t.string "company_state"
    t.string "company_postal_code"
  end

  create_table "identifiers", force: :cascade do |t|
    t.bigint "npi_company_id", null: false
    t.string "code"
    t.string "desc"
    t.string "issuer"
    t.string "number"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npi_company_id"], name: "index_identifiers_on_npi_company_id"
  end

  create_table "last_searches", force: :cascade do |t|
    t.bigint "state_id", null: false
    t.bigint "taxonomy_description_id", null: false
    t.string "skip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_last_searches_on_state_id"
    t.index ["taxonomy_description_id"], name: "index_last_searches_on_taxonomy_description_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.string "address"
    t.string "city"
    t.bigint "state_id", null: false
    t.string "zip"
    t.string "county"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_locations_on_organization_id"
    t.index ["state_id"], name: "index_locations_on_state_id"
  end

  create_table "npi_addresses", force: :cascade do |t|
    t.bigint "npi_company_id", null: false
    t.string "address_purpose"
    t.string "address"
    t.string "city"
    t.bigint "state_id", null: false
    t.string "postal_code"
    t.string "telephone_number"
    t.decimal "latitude", precision: 13, scale: 9
    t.decimal "longitude", precision: 13, scale: 9
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npi_company_id"], name: "index_npi_addresses_on_npi_company_id"
    t.index ["state_id"], name: "index_npi_addresses_on_state_id"
  end

  create_table "npi_companies", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.date "enumeration_date"
    t.date "last_updated"
    t.string "subpart"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "telephone_number"
    t.string "position"
    t.string "prefix"
    t.string "suffix"
    t.string "address"
    t.string "city"
    t.bigint "state_id"
    t.string "postal_code"
    t.string "main_phone_number"
    t.decimal "latitude", precision: 13, scale: 9
    t.decimal "longitude", precision: 13, scale: 9
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_npi_companies_on_parent_id"
    t.index ["state_id"], name: "index_npi_companies_on_state_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "customer"
  end

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pipeline_activities", force: :cascade do |t|
    t.date "end_date"
    t.date "start_date"
    t.integer "week_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "iso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false
  end

  create_table "taxonomies", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxonomy_descriptions", force: :cascade do |t|
    t.string "name"
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

  add_foreign_key "cities", "states"
  add_foreign_key "company_taxonomies", "npi_companies"
  add_foreign_key "company_taxonomies", "taxonomies"
  add_foreign_key "deals", "deal_stages"
  add_foreign_key "deals", "teams"
  add_foreign_key "events", "deals"
  add_foreign_key "events", "pipeline_activities"
  add_foreign_key "identifiers", "npi_companies"
  add_foreign_key "last_searches", "states"
  add_foreign_key "last_searches", "taxonomy_descriptions"
  add_foreign_key "locations", "organizations"
  add_foreign_key "locations", "states"
  add_foreign_key "npi_addresses", "npi_companies"
  add_foreign_key "npi_addresses", "states"
  add_foreign_key "npi_companies", "parents"
  add_foreign_key "npi_companies", "states"
end
