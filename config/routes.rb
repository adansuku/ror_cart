Rails.application.routes.draw do
  resources :products
  resources :carts

  resources :cart_items, only: [:create], as: 'create_cart_items'
  resources :cart_items, only: [:update], as: 'update_cart_items'
  resources :cart_items, only: [:destroy], as: 'destroy_cart_items'

  get 'cart/empty_cart', to: 'carts#empty_cart', as: 'clear_cart_items'
  post '/add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
    # confirmations: 'users/confirmations',
    # unlocks: 'users/unlocks',
    # omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Default root
  root 'products#index'
end
