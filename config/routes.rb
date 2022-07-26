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
    resources :post_users

    resources :tasks do 
      collection do 
        patch :bulk_update
      end

      resources :subtasks do
        collection do 
          patch :bulk_update_subtasks
        end
      end
    end
    
    resources :discussions do 
      resources :answers
    end
    
  end
 
  delete "attachments/:id/purge", to: "attachments#purge", as:"purge_file"
  
  get 'about', to: 'pages#about'

  
end
