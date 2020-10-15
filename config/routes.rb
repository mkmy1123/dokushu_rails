Rails.application.routes.draw do
  resources :users
  root to: 'top#index'
  resources :rooms
  resources :entries, only: [:new, :create, :destroy, :index], path: :rentals do
    post 'comfirm', on: :collection
  end
end
