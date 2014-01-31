RecipeSite::Application.routes.draw do

  resources :recipes do
    resources :reviews, only: [:new, :new2, :create]
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resource :ingredients, only: [:new, :create]
  root to: 'recipes#index'

end
