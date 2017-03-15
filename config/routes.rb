Rails.application.routes.draw do
  resources :posts
  resources :users
  root 'posts#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login" => 'sessions#new', as: :login
  post "/login" => 'sessions#create'
  delete "/logout" => 'sessions#destroy', as: :logout
end
