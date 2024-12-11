# models/recipe.rb
class Recipe < ActiveRecord::Base
    belongs_to :category
    validates :title, presence: true
    validates :ingredients, presence: true
    validates :instructions, presence: true
    validates :preparation_time, presence: true
    validates :difficulty, presence: true
  end
  