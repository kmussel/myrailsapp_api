Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  use_doorkeeper

  devise_for :users, controllers: { passwords: 'passwords' }

  namespace :api do
    resources :users, only: [:index, :update]
    get :audios, to: 'audios#index'
    get :posts, to: 'posts#index'
    post :signup, to: 'signup#index'
    get :me, to: 'users#me'
  end

  root to: 'root#index'
end
