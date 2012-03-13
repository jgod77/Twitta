Twitta::Application.routes.draw do
  resources :users do
    collection do
      get :login
      post :authenticate
      get :logout
    end
  end
  
  match "/about", :to => 'pages#about'
  match "/new", :to => 'users#new'
  root :to => 'pages#home'
  
end
