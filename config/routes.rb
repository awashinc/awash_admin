Rails.application.routes.draw do


  root 'main#index'

  get 'main/index'

  resources :chats, only: [:index, :show]
  resources :messages, only: [:create]

  devise_for :users, :controllers => {:registrations => "users/registrations"}

  namespace(:admin){

    root 'statuses#index'
    #root 'statuses#admin'
    resources :statuses, only: :index

    resources :car_manufacturers
    resources :payments
    resources :washings do 
      resources :washing_comments 
      get :schedule, on: :collection
    end

    resources :cars
    resources :users do
      get :export_users, on: :collection
    end

  }

  namespace(:api){ 
    resources :searches do
      get :find_user, on: :collection
      get :find_user_cars, on: :collection
      get :get_latlon, on: :collection
      get :get_user_cars, on: :collection
    end
  
  }

end
