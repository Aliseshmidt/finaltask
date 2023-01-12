Rails.application.routes.draw do
  get 'builds/index'
  get 'builds/edit'
  get 'builds/new'
  get 'builds/show'
  get 'home/index'
  root 'posts#index'
  # get 'all' => 'users#all', as: 'all'
  # get 'users/profile/:user_id'
  get 'about' => 'pages#about', as: 'about'
  # get 'users/edit'
  resources :admin_msgs
  resources :profiles
  resources :posts do
    resources :comments
    resources :builds
  end
  resource :session, only: %i[new create destroy]
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
