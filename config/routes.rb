Rails.application.routes.draw do


  devise_for :employees
  devise_for :users
  
  #get "users/sign_out" => 'pages#index'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'pages#index'

  resources :leads

  # get 'userinfo' => 'pages#userinfo'

  delete 'userinfo' => 'pages#destroy'

  delete 'index' => 'pages#destroy'


  post 'root' => 'root#sendInformation'


  post 'index' => 'pages#create'

  post 'index' => 'pages#create'
  mount Blazer::Engine, at: "blazer"

  get 'home' => 'pages#home'


  get 'corporate'  => 'pages#corporate'

  get 'residential'  => 'pages#residential'

  get 'submission' => 'quotes#submission'

  get 'intervention' => 'intervention#new'

  post 'intervention_create' => 'intervention#create'

  post 'submission' => 'quotes#create'


  get 'employee' => 'pages#employee'

  get 'submission' => 'pages#submission'

  
  get 'index' => 'pages#index'

  get 'users/index' => 'pages#index'
  
  get 'users/index' => 'pages#index'
  
  get 'employee' => 'pages#employee'
  
  get 'dashboard' => 'pages#dashboard'

  get 'intervention/building' => 'intervention#building'

  get 'intervention/battery' => 'intervention#battery'

  get 'intervention/column' => 'intervention#column'

  get 'intervention/employee' => 'intervention#employee'

  get 'intervention/elevator' => 'intervention#elevator'
  
  post 'intervention' => 'intervention#create'


  resources :geolocations

  
end
