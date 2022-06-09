Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/u/:id', to: "users#profile", as: "user"
  resources :posts do
    resources :comments
  end
  get 'about', to: 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
