Rails.application.routes.draw do
  # resources :cards
  # resources :lists
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :user, only: [:create, :destroy] do
        resources :lists, only: [:index, :show, :update, :create, :destroy] do
          resources :cards, only: [:index, :show, :update, :create, :destroy]
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
