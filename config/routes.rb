Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only:[:edit,:update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
    resources :tasks, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
