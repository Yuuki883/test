Rails.application.routes.draw do
  devise_for :users

  resources :users, only:[:show, :edit, :update] do
  end

  resources :topics do
    resource :responses, only: [:create]
  end

  get 'top' => 'topics#index'
end
