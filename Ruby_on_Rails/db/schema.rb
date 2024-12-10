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

ActiveRecord::Schema[8.0].define(version: 2024_12_10_225946) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", id: :integer, default: nil, force: :cascade do |t|
    t.text "name", null: false
    t.boolean "isActive", null: false

    t.unique_constraint ["name"], name: "categories_name_key"
  end

  create_table "recipes", id: :integer, default: nil, force: :cascade do |t|
    t.text "title", null: false
    t.text "ingredients", null: false
    t.text "instructions", null: false
    t.integer "preparation_time", null: false
    t.text "difficulty", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "schema_migrations", primary_key: "filename", id: :text, force: :cascade do |t|
  end

  add_foreign_key "recipes", "categories", name: "recipes_category_id_fkey", on_delete: :cascade
end
