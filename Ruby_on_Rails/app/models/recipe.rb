class Recipe < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :ingredients, presence: true
  validates :preparation_time, numericality: { only_integer: true, greater_than: 0 }
  validates :difficulty, presence: true
  validates :category_id, presence: true
  validates :image_url, format: {
    with: /\Ahttps?:\/\/.+\.(jpg|jpeg|png|gif)\z/i,
    message: "должно быть корректной ссылкой на изображение (jpg, jpeg, png, gif)"
  }, allow_blank: true
end
