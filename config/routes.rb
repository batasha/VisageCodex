VisageCodex::Application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :users do
    resource :profile

    resource :friend_request do
      put :accept
      put :reject
    end

    resources :messages
    resources :posts do
      resource :photo, only: [:new, :create]
      resource :like, only: [:create, :destroy]
      resources :comments do
        resource :like, only: [:create, :destroy]
      end
    end

    resources :albums do
      resources :photos
    end

    get :wall
    get :news
    get :notifications
    get :edit_avatar
    put :update_avatar
  end

  resources :friends do
    collection do
      get :requests
    end
  end

  resource :account do
    get :settings
  end
end
