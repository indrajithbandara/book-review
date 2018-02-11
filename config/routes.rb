Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'home#index'
  post '/books', to: 'books#create', as: 'create_book'

  resources :books, except: [:new, :show]
  root 'books#index'
  get '/new/book', to: 'books#new', as: 'new_book'
  get '/book/:id', to: 'books#show', as: 'show_book'

 	devise_for :users

end
