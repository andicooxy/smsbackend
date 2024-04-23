Rails.application.routes.draw do
 # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :student_statuses, only: [:index]
    # resources :states
  # end 

  put '/students/unassign/:id', to: 'students#unassign'
  post '/portal/login', to: 'authentications#login'
  get '/portal/login/details', to: 'authentications#details'

  resources :students do
    # put :unassign
    # resources :states
  end 

  resources :levels do
    # resources :states
  end 

  resources :family_members do 
    put :unassign
  end

  resources :relation_types, only: [:index]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root  to: "status#index"
end

