ComplianceChimp::Application.routes.draw do
  root to: 'home#index'
  get 'images/destroy', to: 'images#destroy', as: 'destroy_image'
  resources :requirements, only: :index do
    resources :proofs, only: [:new, :edit, :create, :update], shallow: true
  end
  resources :users, only: [:index, :show, :edit, :update]
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', as: :signin
  match '/signout' => 'sessions#destroy', as: :signout
  match '/auth/failure' => 'sessions#failure'
end
