Twitta::Application.routes.draw do
  resources :users do
    collection do
      get :login
      post :authenticate
      get :logout
    end
  end
  
  root :to => 'pages#home'
  
end
