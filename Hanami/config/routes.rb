# frozen_string_literal: true

module RecepiesDz
  class Routes < Hanami::Routes
    root to: "home.index"

    get "/recipes/new", to: "recipes.new"
    post "/recipes", to: "recipes.create"
    get "/recipes/:id", to: "recipes.show"
    get "/recipes/:id/edit", to: "recipes.edit"
    patch "/recipes/:id", to: "recipes.update"
    delete "/recipes/:id", to: "recipes.delete"

    get "/categories", to: "categories.index"
    get "/categories/new", to: "categories.new"
    post "/categories", to: "categories.create"
    get "/categories/:id", to: "categories.show"
  end
end
