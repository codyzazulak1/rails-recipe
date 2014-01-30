RecipeSite::Application.routes.draw do

  resources :recipes do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'recipes#index'

end
