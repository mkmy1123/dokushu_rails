Rails.application.routes.draw do
  resources :users
  root to: 'top#index'
  resources :rooms
  resources :rooms do
    resources :entries, only: [:new, :create, :destroy, :index],
                        path: :rentals, shallow: true do
      post :confirm, on: :collection
      post :confirm_back, on: :collection
    end
  end
end
