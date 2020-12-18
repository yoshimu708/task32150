Rails.application.routes.draw do
  devise_for :users
  root to: "users#show"
  resources :users, only:[:edit,:update, :show] do
    resources :favorites, only:[:index]
  end 
  resources :rooms, only: [:new, :create, :destroy] ,shallow: true do
    resources :messages, only: [:index, :create, :destroy]
    resources :tasks, only: [:index, :create, :edit, :destroy, :update],shallow: true do
      resources :favorites,only:[:create,:destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
