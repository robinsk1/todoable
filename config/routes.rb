Todoable::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :projects, except: :show, :path => "lists" do
    #get :autocomplete_tag_name, :on => :collection
  end

  resources :projects, except: :show, :path => "lists"  do
    member do
      put :join
      put :leave
    end

    collection do
      get 'owner'
      get 'joined'
    end

   resources :todos
   resources :participations, only: :index
  end



  #resources :users do
  #  resources :projects, :path => "lists"
  #end




  resources :todos do
    member do
      put :toggle
    end
  end




  authenticated :user do
    root :to => 'projects#index'
  end

  root :to => "home#index"



  devise_for :users
  resources :users do
      resources :projects, :path => "lists"
    end
end