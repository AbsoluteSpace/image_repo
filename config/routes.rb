Rails.application.routes.draw do
  root to: "images#index"
  devise_for :users
  
  resources :images
  resources :discounts
  get '/admin', to: "pages#admin"
  get '/about', to: "pages#about"
  get '/confirmed', to: "pages#home"
  get '/images/purchase/:id', to: "images#purchase"
end
