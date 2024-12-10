class Recipe < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :ingredients, presence: true
  validates :preparation_time, numericality: { only_integer: true, greater_than: 0 }
  validates :difficulty, presence: true
  validates :category_id, presence: true
end
