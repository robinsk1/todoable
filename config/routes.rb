Todoable::Application.routes.draw do
  root :to => "home#index"
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "/cities", :to=>"projects#cities", :as => :cities
  get "/cities/lists/:city",  :to=>"projects#index", :as=> :scope_list_by_city

  resources :projects, :except=> [:create,:new, :edit, :update, :destroy], :path => "lists"  do
      resources :participations, only: :index
      resources :todos, :only=> [:create]
  end

  resources :todos, :except => [:create, :index, :new, :edit, :show] do
      member do
        put :toggle
      end
  end




  authenticated :user do
    root :to => 'projects#cities'
  end

  devise_for :users

  resources :users, :only => [:index, :show] do
    resources :projects, :except =>[:show], :path => "lists" do
      member do
         put :join
         put :leave
      end

      collection do
           get 'joined'
      end
    end
  end

end