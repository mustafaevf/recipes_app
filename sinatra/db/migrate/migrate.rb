# # db/migrate/202412111200_create_categories_and_recipes.rb
# class CreateCategoriesAndRecipes < ActiveRecord::Migration[6.1]
#     def change
#       create_table :categories do |t|
#         t.string :name, null: false, unique: true
#         t.boolean :is_active, null: false
#         t.timestamps
#       end
  
#       create_table :recipes do |t|
#         t.string :title, null: false
#         t.text :ingredients, null: false
#         t.text :instructions, null: false
#         t.integer :preparation_time, null: false
#         t.string :difficulty, null: false
#         t.references :category, null: false, foreign_key: true
#         t.timestamps
#       end
#     end
#   end
  # Миграция для рецепта
class CreateRecipes < ActiveRecord::Migration[7.0]
    def change
      create_table :recipes do |t|
        t.string :title
        t.text :ingredients
        t.text :instructions
        t.integer :preparation_time
        t.string :difficulty
        t.integer :category_id
  
        t.timestamps
      end
    end
  end
  