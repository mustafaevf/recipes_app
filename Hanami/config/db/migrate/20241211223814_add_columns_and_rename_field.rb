# frozen_string_literal: true

ROM::SQL.migration do
  # Add your migration here.
  #
  # See https://guides.hanamirb.org/v2.2/database/migrations/ for details.
  change do
    add_column :recipes, :image_url, String

    rename_column :categories, :isActive, :is_active
  end
end
