Todoable::Application.routes.draw do
  root :to => "home#index"


  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "/cities", :to=>"projects#cities", :as => :cities
  get "/cities/lists/:city",  :to=>"projects#index", :as=> :scope_list_by_city

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


  resources :todos do
    member do
      put :toggle
    end
  end

  authenticated :user do
    root :to => 'projects#cities'
  end


  devise_for :users
  resources :users do
      resources :projects, :path => "lists"
    end
end