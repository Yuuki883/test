Rails.application.routes.draw do
  devise_for :users

  resources :users, only:[:show, :edit, :update] do
  end

  resources :topics do
    resource :responses, only: [:create]
  end

  resources :categories, except: [:new, :show]

  root to: 'topics#index'
end
