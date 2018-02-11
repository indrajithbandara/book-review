Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'home#index'

  resources :books, except: [:new, :show]
  root 'books#index'
  get '/new/book', to: 'books#new', as: 'new_book'
  get '/book/:id', to: 'books#show', as: 'show_book'
 
	devise_scope :user do
    get "/register" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end
 	devise_for :users, skip: [:sessions]
	as :user do
	  get 'login', to: 'devise/sessions#new', as: :new_user_session
	  post 'login', to: 'devise/sessions#create', as: :user_session
	  delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
	end


end
