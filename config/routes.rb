Rails.application.routes.draw do
  get 'products/show'
  get 'products/create'
  get 'products/edit'
  get 'products/update'
  get 'products/destroy'

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
  root 'products#show'
end
