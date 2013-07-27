Todoable::Application.routes.draw do
  root :to => "home#index"
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "/cities", :to=>"projects#cities", :as => :cities
  get "/cities/lists/:city",  :to=>"projects#index", :as=> :scope_list_by_city

  post "/lists/:id/join", :to=>"participations#create", :as=> :join_project
  delete "/lists/:id/join", :to=>"participations#destroy", :as=> :leave_project

  post "/todo/:id/complete", :to=>"completes#create", :as=> :complete_todo
  delete "/todo/:id/complete", :to=>"completes#destroy", :as=> :uncomplete_todo

  post "/like/:model_class/id/:id", :to=>"likes#create", :as=> :like
  delete "/like/:model_class/id/:id", :to=>"likes#destroy", :as=> :unlike

  post "/up/:model_class/id/:id", :to=>"votes#for", :as => :vote_for
  post "/down/:model_class/id/:id", :to=>"votes#against", :as => :vote_against

  get '/lists/tags/:tag', to: 'projects#index', as: :tag



  resources :projects, :except=> [:create, :new, :edit, :update, :destroy], :path => "lists"  do
      resources :participations, only: :index
      resources :todos, :only=> [:create]
  end

  resources :todos, :except => [:create, :index, :new, :edit, :show] do

  end


  authenticated :user do
    root :to => 'projects#cities'
  end

  devise_for :users

  resources :users, :only => [:index, :show] do
    resources :projects, :except =>[:show], :path => "lists" do
      collection do
        get 'joined'
      end
    end
  end

end