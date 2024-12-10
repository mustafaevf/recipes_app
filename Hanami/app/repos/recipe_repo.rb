# frozen_string_literal: true

module RecepiesDz
  module Repos
    class RecipeRepo < RecepiesDz::DB::Repo
      commands :create
      def all
        recipes.to_a
      end
      
      def find(id)
        recipes.where(id: id).one
      end

      def find_by_category_id(category_id)
        recipes.where(category_id: category_id).to_a
      end

      def create(data)
        recipes.command(:create).call(data)
      end

      def update(id, data)
        recipes.where(id: id).update(data.to_h)
      end

      def delete(id)
        recipes.where(id: id).delete
      end

    end
  end
end
