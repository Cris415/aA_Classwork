Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :subs
    resources :posts
  end
  resource :session

  resources :subs do 
    resources :posts
  end

end
