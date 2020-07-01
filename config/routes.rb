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
  resources :reservations, only: %i[new create edit update destroy]do 
   get 'start', on: :member
  end




 #get 'api/v1/cars', to: 'api#cars'
 namespace :api, defaults: {format: :json } do
    namespace :v1 do
      resources :descriptions, only: %i[index show create update destroy]
    end
  end  
 namespace :api, defaults: {format: :json } do
    namespace :v1 do
      resources :collaborators, only: %i[index show create update destroy]
    end
  end  
 namespace :api, defaults: {format: :json } do
    namespace :v1 do
      resources :products, only: %i[index show create update destroy]
    end
  end  
 namespace :api, defaults: {format: :json } do
    namespace :v1 do
      resources :manufacturers, only: %i[index show create update destroy]
    end
  end  
end
