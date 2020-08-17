Rails.application.routes.draw do

  devise_for :end_users
  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  root 'tops#top'
  get 'tops/introduction'
  get 'search' => 'search#search'

  resources :bulletin_boards, only: [:index,:show,:create] do
    resources :bulletin_board_comments, only: [:create]
  end

  resources :products, only: [:index,:show] do
    resources :product_comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end

  resources :end_users, only: [:show,:edit,:update] do
    get '/withdrawal' => 'end_users#withdrawal'
    patch '/withdrawal' => 'end_users#withdrawal_update'
    put '/withdrawal' => 'end_users#withdrawal_update'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :carts, only: [:index, :create, :destroy, :update]
    delete '/carts' => 'carts#all_destroy'
    get '/address_check' => 'orders#address_check'
    get '/order_check' => 'orders#order_check'
    get '/thanks' => 'orders#thanks'
    resources :orders, only: [:index,:show,:create] do
      resources :order_items, only: [:create]
    end
  end

  namespace :admins do
    resources :end_users, only: [:index,:show,:edit] do
      resources :orders, only: [:index,:show] do
        resources :order_items, only: [:update]
      end
    end
    resources :products, only:[:index,:show] do
      resources :types, only:[:index,:edit]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
