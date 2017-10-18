Rails.application.routes.draw do

  root 'pages#home'

  devise_for 	:users,
  						path: '',
  						path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
  						controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}


resources :users, only: [:show] do
  member do
    post '/verify_phone_number' => 'users#verify_phone_number'
    patch '/update_phone_number' => 'users#update_phone_number'
  end
end

resources :rooms
resources :rooms, except: [:edit] do
  resources :photos, only: [:create, :destroy]
  resources :reservations, only: [:create]
end

resources :guest_reviews, only: [:create, :destroy]
resources :host_reviews, only: [:create, :destroy]

get '/preload' => 'reservations#preload'
get '/preview' => 'reservations#preview'
get '/your_trips' => 'reservations#your_trips'
get '/your_reservations' => 'reservations#your_reservations'
post '/notify' => 'reservations#notify'

get 'search' => 'pages#search'

# ------Part 2 ------
get 'dashboard' => 'dashboards#index'

resources :reservations, only: [:approve, :decline] do
  member do
    post '/approve' => "reservations#approve"
    post '/decline' => "reservations#decline"
  end
end
