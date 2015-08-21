Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :subs
  resources :posts, only: [:create, :new, :update, :destroy, :edit, :show] do
    resources :comments, only: [:new, :create]
  end
  resources :comments, only: [:destroy]
end
