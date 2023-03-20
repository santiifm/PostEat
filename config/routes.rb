Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  resources :logs
  devise_for :users, :controllers => {registration: 'users/registrations'}
  root to: "articles#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
