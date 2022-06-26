Rails.application.routes.draw do
  
  root "pages#home"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'users/profile'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/u/:id', to: "users#profile", as: "user"

  resources :posts do
    resources :comments
    resources :tasks
  end

  get 'about', to: 'pages#about'

  
end
