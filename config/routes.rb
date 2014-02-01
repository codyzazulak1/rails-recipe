RecipeSite::Application.routes.draw do
  get '/recipes/search', to: 'recipes#search', as: 'recipes_search'
  resources :recipes do
    resources :reviews, only: [:new, :new2, :create]
    resource :ingredients, only: [:new, :create]
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'recipes#index'
  resource :ingredients do
  	collection do
  		post :searchResults
  	end

  end

end
