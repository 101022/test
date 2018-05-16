Rails.application.routes.draw do
  resources :comments,  only: [:update]
  resources :posts,     only: [:index, :create, :edit, :destroy]

  resources :posts do
    resources :comments, only: [:index, :create, :edit, :destroy]
  end
  
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home#index'
end
