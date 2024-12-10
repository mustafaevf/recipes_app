# frozen_string_literal: true

module RecepiesDz
  module Actions
    module Recipes
      class Update < RecepiesDz::Action
        include Deps["repos.recipe_repo"]

        def handle(request, response)
          recipe_id = request.params[:id]
          updated_data = request.params.to_h.slice(:title, :ingredients, :instructions, :preparation_time, :category_id, :difficulty)
          
          recipe_repo.update(recipe_id, updated_data)
          

          response.redirect_to "/recipes/#{recipe_id}"
        end
      end
    end
  end
end
