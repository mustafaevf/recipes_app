# frozen_string_literal: true

module RecepiesDz
  module Actions
    module Recipes
      class Show < RecepiesDz::Action
        include Deps["repos.recipe_repo"]

        def handle(request, response)
          recipe_id = request.params[:id]
          recipe = recipe_repo.find(recipe_id)

          if recipe.nil?
            response.status = 404
            response.body = "Рецепт с ID=#{recipe_id} не найден"
          else
            response.render(view, recipe: recipe)
          end
        end
      end
    end
  end
end
