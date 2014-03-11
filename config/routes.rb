ComplianceChimp::Application.routes.draw do
  root :to => "requirements#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
  resources :requirements, only: :index do
    resources :proofs, only: [:new, :create], shallow: true
  end
end
