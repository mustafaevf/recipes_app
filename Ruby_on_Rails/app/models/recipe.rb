class Recipe < ApplicationRecord
  belongs_to :category
  validates :title, :ingredients, :instructions, :preparation_time, :difficulty, presence: true
end
