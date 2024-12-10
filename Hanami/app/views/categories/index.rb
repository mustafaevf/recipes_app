# frozen_string_literal: true

module RecepiesDz
  module Views
    module Categories
      class Index < RecepiesDz::View
        include Deps["repos.category_repo"]
        
        expose :categories do
          category_repo.all
        end
      end
    end
  end
end
