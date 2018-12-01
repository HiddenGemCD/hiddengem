Rails.application.routes.draw do
 
  # resources :cards
  # resources :lists
  # root to: 'pages#home'
  post '/login', to: "login#login"
  
  #update_user_info
  post '/update_user_info', to: "login#update_user_info"

 

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # get specific card
      get 'cards/:id', to: 'cards#show'
      # get specific list
      get 'lists/:id', to: 'lists#show'
      #show all cards
      get 'cards', to: 'cards#index'
      #show all lists
      get 'lists', to: 'lists#index'
      #get user's cards
      get 'users/:id/cards', to: 'cards#show_user_cards', as: 'show_user_cards'
      #get list's cards
      get 'lists/:id/cards', to: 'cards#show_list_cards', as:
      'show_list_cards'
      #get user's lists
      get 'users/:id/lists', to: 'lists#show_user_lists', as: 'get_user_lists'
      #user create a card directly
      post 'users/:id/cards', to: 'cards#create', as: 'create_card'
      #user create a list 
      post 'users/:id/lists', to: 'lists#create', as: 'create_list'

      #get users 
      get '/users', to: 'users#index'
      get '/users/:id', to: 'users#show'

      resources :lists, only: [:destroy]
      resources :cards, only: [:destroy]

      resources :users, only: [:create, :destroy] do
        resources :cards, only: [:update]
        resources :lists, only: [:update, :destroy] do
          resources :cards, only: [:update, :destroy]
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
