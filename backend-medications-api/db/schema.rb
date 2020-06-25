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

ActiveRecord::Schema.define(version: 2020_06_25_174134) do

  create_table "addfunds", force: :cascade do |t|
    t.float "amount"
    t.date "addeddate"
    t.integer "bankaccount_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bankaccount_id"], name: "index_addfunds_on_bankaccount_id"
  end

  create_table "bankaccounts", force: :cascade do |t|
    t.float "balance"
    t.string "currency"
    t.integer "patient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_bankaccounts_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.float "priceperpill"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.date "dob"
    t.string "ethnicity"
    t.integer "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_patients_on_doctor_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer "dosagestotal"
    t.integer "dosagesper"
    t.string "dosagesfrequency"
    t.integer "patient_id", null: false
    t.integer "medication_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medication_id"], name: "index_prescriptions_on_medication_id"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
  end

  create_table "takedosages", force: :cascade do |t|
    t.date "datetaken"
    t.integer "prescription_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prescription_id"], name: "index_takedosages_on_prescription_id"
  end

  add_foreign_key "addfunds", "bankaccounts"
  add_foreign_key "bankaccounts", "patients"
  add_foreign_key "patients", "doctors"
  add_foreign_key "prescriptions", "medications"
  add_foreign_key "prescriptions", "patients"
  add_foreign_key "takedosages", "prescriptions"
end
