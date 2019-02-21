Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cabins, only: [:show, :index, :new, :create] do
    resources :bookings, only: [:new, :create]
    collection do
      get 'top'
      get 'destination'
      get 'capacity'
      get 'search'
    end
  end

  resources :bookings, only: :show

  resources :users, only: [:show, :edit, :update]

  resources :bookings, only: [:index]

end
