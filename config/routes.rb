Rails.application.routes.draw do

  root 'pages#home'

  devise_for 	:users,
  						path: '',
  						path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
  						controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  resources :users, only: [:show]
  resources :rooms
    resources :photos, only: [:create, :destroy]


  resources :rooms do
    resources :reservations, only: [:create]
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :rooms do
    resources :guest_reviews, only: [:create, :destroy]
    resources :host_reviews, only: [:create, :destroy]
  end

  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'

  get '/your_trips' => 'reservations#your_trips'
  get '/your_reservations' => 'reservations#your_reservations'

  post '/notify' => 'reservations#notify'
  post '/your_trips' => 'reservations#your_trips'

  get '/search' => 'pages#search'

end
