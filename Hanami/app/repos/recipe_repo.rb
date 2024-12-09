# frozen_string_literal: true

module RecepiesDz
  module Repos
    class RecipeRepo < RecepiesDz::DB::Repo
      
      def all
        recipes.to_a
      end
      
      def find(id)
        recipes.where(id: id).one
      end

      def create(data)
        recipes.create(data)
      end

      def update(id, data)
        recipes.where(id: id).update(data)
      end

      def delete(id)
        recipes.where(id: id).delete
      end

    end
  end
end
