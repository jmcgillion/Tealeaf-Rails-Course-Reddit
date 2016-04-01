PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  resources :posts do 
  	resources :comments, only: :create
  end

  resources :categories, only: [:show, :new, :create] 
	resources :users, only: [:show, :create, :edit, :update]
end









