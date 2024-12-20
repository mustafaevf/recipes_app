# frozen_string_literal: true

module RecepiesDz
  module Views
    module Home
      class Index < RecepiesDz::View
        include Deps["repos.recipe_repo"]
        include Deps["repos.category_repo"]

        expose :recipes do
          recipe_repo.all
        end
        expose :categories do
          category_repo.all
        end
      end
    end
  end
end
