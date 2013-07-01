Todoable::Application.routes.draw do
  resources :projects, :path => "lists" do
    #get :autocomplete_tag_name, :on => :collection
  end

  resources :projects, :path => "lists"  do
   resources :todos
  end

  #resources :users do
  #  resources :projects, :path => "lists"
  #end




  resources :todos do
    put :toggle
  end


  authenticated :user do
    root :to => 'projects#index'
  end
  root :to => "projects#index"
  devise_for :users
  resources :users do
      resources :projects, :path => "lists"
    end
end