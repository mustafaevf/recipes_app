# frozen_string_literal: true

module RecepiesDz
  module Actions
    module Recipes
      class Search < RecepiesDz::Action
        include Deps["repos.recipe_repo"]
        def handle(request, response)
          query = request.params[:query]

          recipes = recipe_repo.search_by_title(query)

          if recipes.nil?
            response.status = 404
            response.body = "Рецепт с ID=#{query} не найден"
          else
            response.render(view, recipes: recipes, query: query)
          end
        end
      end
    end
  end
end
