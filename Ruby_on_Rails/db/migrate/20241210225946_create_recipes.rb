class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    unless table_exists?(:recipes)
      create_table :recipes do |t|
        t.string :title
        t.text :ingredients
        t.text :instructions
        t.integer :preparation_time
        t.string :difficulty
        t.references :category, null: false, foreign_key: true

        t.timestamps
      end
    end
  end
end
