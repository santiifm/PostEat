Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  resources :activities
  devise_for :users
  
  root to: "articles#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
