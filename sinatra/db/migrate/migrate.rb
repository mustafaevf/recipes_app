class CreateRecipes < ActiveRecord::Migration[7.0]
    def change
      create_table :recipes do |t|
        t.string :title
        t.text :ingredients
        t.text :instructions
        t.integer :preparation_time
        t.string :difficulty
        t.integer :category_id
        t.string :image_url  # Добавляем поле для изображения
  
        t.timestamps
      end
    end
  end
  