Rails.application.routes.draw do
  devise_for :users

  resources :users, only:[:show, :edit, :update] do
  end

  get 'top' => 'topics#index'
end
