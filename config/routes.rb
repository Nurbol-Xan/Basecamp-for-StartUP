Rails.application.routes.draw do
  resources :questions do 
    resources :answers
  end

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

  root "pages#home"
end
