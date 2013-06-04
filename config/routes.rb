VisageCodex::Application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :users do
    resource :user_profile
  end

  resource :account do
    get :settings
  end
end
