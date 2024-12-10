# frozen_string_literal: true

module RecepiesDz
  module Views
    module Recipes
      class Edit < RecepiesDz::View
        include Deps["repos.category_repo"]

        expose :categories do
          category_repo.all
        end
        expose :recipe
      end
    end
  end
end
