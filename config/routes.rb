Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index, :edit, :new, :show, :create]
  root "items#index"
end
