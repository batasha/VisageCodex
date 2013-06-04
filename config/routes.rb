VisageCodex::Application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :users do
    resource :profile
    get :edit_avatar
    put :update_avatar
  end

  resource :account do
    get :settings
  end
end
