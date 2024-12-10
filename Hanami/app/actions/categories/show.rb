# frozen_string_literal: true

module RecepiesDz
  module Actions
    module Categories
      class Show < RecepiesDz::Action
        include Deps["repos.recipe_repo"]

        def handle(request, response)
          category_id = request.params[:id]
          recipes = recipe_repo.find_by_category_id(category_id)

          if recipes.nil?
            response.status = 404
            response.body = "Рецепты с category_id=#{category_id} не найдены"
          else
            response.render(view, recipes: recipes)
          end
        end
      end
    end
  end
end
