VisageCodex::Application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :users do
    resource :profile

    resource :friend_request do
      put :accept
      put :reject
    end

    get :edit_avatar
    put :update_avatar
  end

  resources :friends

  resource :account do
    get :settings
  end
end
