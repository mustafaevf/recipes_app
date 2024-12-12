class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    unless table_exists?(:categories)
      create_table :categories do |t|
        t.string :name
        t.boolean :is_active, default: true

        t.timestamps
      end
    end
  end
end
