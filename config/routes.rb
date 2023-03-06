Rails.application.routes.draw do
  
  # 一般ユーザーで使用するルーティング
  scope module: :public do
    root to: 'homes#top'
    
    resources :items, only: [:index, :show] do
      resources :comments, only: [:new, :index, :create]
    end
    
    resource :users, only: [:show, :edit, :update] do
      get :check, on: :collection
      patch :withdrawl, on: :collection
    end
    
    get "search" => "searches#search"
    resources :operation_systems, only: [:show]
    resources :central_processing_units, only: [:show]
    resources :certifications, only: [:show]
    resources :specs, only: [:show]
    resources :mekars, only: [:show]
    resources :capacities, only: [:show]
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
