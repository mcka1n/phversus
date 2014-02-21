Phversus::Application.routes.draw do
  #devise_for :users
  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "omniauth_callbacks" }
  
  resources :after_signup

  root :to => "home#index"
  resources :votes

  resources :home do
    member do
      post :vote_up
    end
  end
  
end
