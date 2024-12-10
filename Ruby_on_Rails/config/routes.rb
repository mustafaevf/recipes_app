Rails.application.routes.draw do
  resources :recipes, only: [:index, :show, :create, :update, :destroy] do
    member do
      patch :toggle_favorite
    end
  end

  root "recipes#index"
end
