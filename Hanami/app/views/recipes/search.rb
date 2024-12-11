# frozen_string_literal: true

module RecepiesDz
  module Views
    module Recipes
      class Search < RecepiesDz::View
        include Deps["repos.category_repo"]

        expose :query
        expose :recipes
        expose :categories do
          category_repo.all
        end
      end
    end
  end
end
