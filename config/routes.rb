Todoable::Application.routes.draw do
  resources :projects

  resources :projects  do
   resources :todos
  end





  resources :todos


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end