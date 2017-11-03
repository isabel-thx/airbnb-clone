Rails.application.routes.draw do


  root 'hello#index'

  #resources

  resources :users, only: [:show, :edit, :update, :index] do
    resources :listings, only: [:show, :index]
    # resources :reservations
  end

  # <%= link_to "this particular listing under particular user", user_listing_path(current_user, @listing)
  get "/homepage" => "hello#index", as: "home"

  # verify listing
  resources :listings do
    resources :reservations, except: [:edit, :update]
    member do
      get 'verify'
    end
  end
  # same as
  # get '/listings/:id/verify' => 'listings#verify', as: :verify_listing

  # upgrade user role
  post '/users/:id/upgrade' => "users#upgrade", as: "upgrade"

  # downgrade user role
  post '/users/:id/downgrade' => "users#downgrade", as: "downgrade"

  # user reservations
  get '/users/:id/reservations' => "reservations#user_index", as: "user_reservations"
  get '/users/:user_id/reservations/:id/edit' => "reservations#user_edit", as: "edit_user_reservation"
  get '/users/:user_id/reservations/:id' => "reservations#user_show", as: "user_reservation"
  patch '/users/:user_id/reservations/:id' => "reservations#user_update"
  delete '/users/:user_id/reservations/:id' => "reservations#user_destroy"

  # make payment
  get '/reservations/:id/checkout', to: "braintree#new", as:"braintree_new"
  post '/reservations/:id/pay', to: 'braintree#create', as: "braintree_pay"
  #post '/reservations/:id/payments' , to: "braintree#checkout", as: "braintree_checkout"


  
  #facebook authentication
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


  #clearance routes start here
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]

  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #clearance routes ends here
  

end
