Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
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


  resources :user, only: :show do
    resources :cabins
  end


end
