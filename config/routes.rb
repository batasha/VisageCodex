VisageCodex::Application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users do
    resources :user_profiles
  end
end
