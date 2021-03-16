Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # /api/v1/restaurants
      resources :restaurants, except: [:new, :edit]
    end
  end
  
  # /restaurants
  # resources :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
