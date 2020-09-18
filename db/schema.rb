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

ActiveRecord::Schema.define(version: 2020_09_18_214622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "school_name"
    t.string "description"
    t.date "phase_actual_start_date"
    t.date "phase_planned_end_date"
    t.date "phase_actual_end_date"
    t.float "budget"
    t.float "final_estimate_of_actual_costs"
    t.float "total_phase_actual_spending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["description"], name: "index_projects_on_description"
    t.index ["school_name"], name: "index_projects_on_school_name"
  end

end
