Rails.application.routes.draw do

  root 'hello#index'

  #resources

  


  resource :reservations, only: [:show]

  resources :users, only: [:show, :edit, :update, :index] do
    resources :listings, only: [:show, :index]
  end

  # <%= link_to "this particular listing under particular user", user_listing_path(current_user, @listing)
  get "/homepage" => "hello#index", as: "home"

  # verify listing
  resources :listings do
    member do
      get 'verify'
    end
  end
  # same as
  # get '/listings/:id/verify' => 'listings#verify', as: :verify_listing

  #change user role
  post '/users/:id/upgrade', to: "users#upgrade", as: "upgrade"

  # book listing
  get '/listings/:id/book' => 'listings#book', as: :book_listing





  
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
