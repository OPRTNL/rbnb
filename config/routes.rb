Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cabins, only: [:show, :index] do
    resources :bookings, only: [:new, :create]
    collection do
      get 'top'
      get 'destination'
      get 'capacity'
    end
  end

  resources :bookings, only: :show


  resources :users, only: [:show, :edit, :update] do
    resources :owned_cabins

  end


end
