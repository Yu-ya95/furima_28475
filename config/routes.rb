Rails.application.routes.draw do
  devise_for :users
  resources :markets, only: [:index, :edit, :new, :show]
  root "markets#index"
end
