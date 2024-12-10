# frozen_string_literal: true

ROM::SQL.migration do
  # Add your migration here.
  #
  # See https://guides.hanamirb.org/v2.2/database/migrations/ for details.
  change do
    create_table :categories do
      primary_key :id
      column :name, String, null: false, unique: true
      column :isActive, :boolean, null: false 
    end

    create_table :recipes do
      primary_key :id
      column :title, String, null: false
      column :ingredients, String, text: true, null: false
      column :instructions, String, text: true, null: false
      column :preparation_time, Integer, null: false
      column :difficulty, String, null: false
      # column :favorite, :boolean, default: false, null: false
      foreign_key :category_id, :categories, null: false, on_delete: :cascade
      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
