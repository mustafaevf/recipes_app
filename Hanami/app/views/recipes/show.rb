module RecepiesDz
  module Views
    module Recipes
      class Show < RecepiesDz::View
        include Deps["repos.category_repo"]
        expose :recipe
        expose :categories do
          category_repo.all
        end
      end
    end
  end
end