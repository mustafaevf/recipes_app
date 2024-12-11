# frozen_string_literal: true

module RecepiesDz
  module Actions
    module Recipes
      class Create < RecepiesDz::Action
        include Deps['repos.recipe_repo', 'repos.category_repo']

        params do
          required(:title).filled(:string)
          required(:category_id).filled(:integer)
          required(:ingredients).filled(:string)
          required(:instructions).filled(:string)
          required(:preparation_time).filled(:integer)
          required(:image_url).filled(:string)
          required(:difficulty).filled(:string)
        end

        def handle(request, response)
          if request.params.valid?
            recipe_repo.create(
              title: request.params[:title],
              category_id: request.params[:category_id],
              ingredients: request.params[:ingredients],
              instructions: request.params[:instructions],
              preparation_time: request.params[:preparation_time],
              image_url: request.params[:image_url],
              difficulty: request.params[:difficulty]
            )
            response.redirect '/'
          else
            response.status = 422
          end
        end
      end
    end
  end
end
