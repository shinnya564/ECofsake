# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :secret do
    get 'producer/show'
  end
  namespace :admins do
    get 'admins/index'
    get 'admins/show'
    get 'admins/edit'
  end
  devise_for :end_users, controllers: {
    sessions: 'endusers/sessions',
    passwords: 'endusers/passwords',
    registrations: 'endusers/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  root 'tops#top'
  get 'tops/introduction'
  get 'search_products' => 'search#search_products'
  get 'search_types' => 'search#search_types'

  get 'inquiries' => 'inquiries#new'
  get 'inquiries/confirm' => 'inquiries#confirm'
  get 'inquiries/thanks' => 'inquiries#thanks'

  resources :bulletin_boards, only: %i[index show create] do
    resources :bulletin_board_comments, only: [:create]
  end

  resources :products, only: %i[index show] do
    resources :product_comments, only: [:create]
    resource :favorites, only: %i[create destroy]
  end

  resources :end_users, only: %i[show edit update] do
    get '/withdrawal' => 'end_users#withdrawal'
    patch '/withdrawal' => 'end_users#withdrawal_update'
    put '/withdrawal' => 'end_users#withdrawal_update'
    resources :addresses, only: %i[index edit create update destroy]
    resources :cards, only: %i[new index create destroy]
    get '/card_check' => 'cards#card_check'
    resources :carts, only: %i[index create destroy update]
    delete '/carts' => 'carts#all_destroy'
    get '/address_check' => 'orders#address_check'
    get '/order_check' => 'orders#order_check'
    get '/thanks' => 'orders#thanks'
    resources :orders, only: %i[index show create] do
      resources :order_items, only: [:create]
    end
  end

  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'endusers/sessions#new_guest'
  end

  namespace :admins do
    resources :admins, only: %i[index show edit update]
    resources :orders, only: [:index]
    get '/earnings' => 'orders#earnings'
    resources :end_users, only: %i[index show edit update] do
      resources :orders, only: %i[index show update] do
        resources :order_items, only: [:update]
        patch '/order_items' => 'order_items#all_update'
        put '/order_items' => 'order_items#all_update'
      end
    end
    resources :products, only: %i[index show create edit update new]
    resources :types, only: %i[index edit update create]
  end

  devise_scope :admin do
    post 'admins/guest_sign_in', to: 'admins/sessions#new_guest'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
