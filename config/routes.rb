Phversus::Application.routes.draw do
  #devise_for :users
  devise_for :users, :controllers => { :registrations => "registrations" }
  
  resources :after_signup

  root :to => "home#index"
  resources :votes
end
