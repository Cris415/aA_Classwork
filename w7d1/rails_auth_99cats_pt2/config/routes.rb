Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:new, :create] do
    member do
      post :approve
      post :deny
    end
  end

  resources :users, only: [:new, :create] do
  end

  resource :sessions, only: [:new, :create, :destroy] do
  end



  root to: redirect('/cats')
end
