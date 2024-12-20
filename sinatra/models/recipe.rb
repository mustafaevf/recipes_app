# models/recipe.rb
class Recipe < ActiveRecord::Base
    belongs_to :category
    validates :title, presence: true
    validates :ingredients, presence: true
    validates :instructions, presence: true
    validates :preparation_time, presence: true
    validates :difficulty, presence: true
    validates :image_url, format: {
    with: /\Ahttps?:\/\/.+\.(jpg|jpeg|png|gif)\z/i,
    message: "должно быть корректной ссылкой на изображение (jpg, jpeg, png, gif)"
  }, allow_blank: true
  end
  