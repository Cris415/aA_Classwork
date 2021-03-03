Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bands do
    resources :albums, only: [:new, :create] 
  end

  resources :tracks, except: [:index, :new]


  resources :albums, except: [:new, :create, :index] do
    resources :tracks, only: [:new, :create]
  end


  resources :users, only: [:new, :create, :show, :destroy] 
  resource :sessions, only: [:new, :create, :destroy]
end
