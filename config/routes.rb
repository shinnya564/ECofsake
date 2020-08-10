Rails.application.routes.draw do

  devise_for :end_users
  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  root 'tops#top'
  get 'tops/introduction'

  resources :bulletin_boards, only: [:index,:show,:create] do
    resources :bulletin_board_comments, only: [:create]
  end

  resources :products, only: [:index,:show]

  resources :end_users, only: [:show,:edit] do
    resources :addresses, only: [:index,:edit]
    resources :carts, only: [:index]
    resources :orders, only: [:index,:show,:create]
    resources :order_items, only: [:create]
  end

  namespace :admins do
    resources :charriages, only: [:index, :edit]
    resources :end_users, only: [:index,:show,:edit] do
      resources :orders, only: [:index,:show]
    end
    resources :products, only:[:index,:show] do
      resources :types, only:[:index,:edit]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
