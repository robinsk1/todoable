Todoable::Application.routes.draw do
  resources :projects

  resources :projects  do
   resources :todos
  end





  resources :todos


  authenticated :user do
    root :to => 'todos#index'
  end
  root :to => "todos#index"
  devise_for :users
  resources :users
end