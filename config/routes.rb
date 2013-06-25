Todoable::Application.routes.draw do
  resources :projects, :path => "lists"

  resources :projects, :path => "lists"  do
   resources :todos
  end

  resources :users do
    resources :projects, :path => "lists"
  end




  resources :todos do
    put :toggle
  end


  authenticated :user do
    root :to => 'todos#index'
  end
  root :to => "todos#index"
  devise_for :users
  resources :users
end