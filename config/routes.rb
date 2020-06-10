Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :manufacturers
  resources :products
  resources :descriptions do
    get 'search', on: :collection
  end
  resources :collaborators do 
    get 'search', on: :collection
  end
  resources :aggregates
end
