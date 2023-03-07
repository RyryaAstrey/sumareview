Rails.application.routes.draw do
  
  # 一般ユーザーで使用するルーティング
  scope module: :public do
    root to: 'homes#top'
    
    # 投稿記事関連
    resources :items, only: [:index, :show] do
      resources :comments, only: [:new, :index, :create]
    end
    
    # ユーザー関連
    resource :users, only: [:show, :edit, :update] do
      get :check, on: :collection
      patch :withdrawal, on: :collection
    end
    
    # 検索関連
    get "search" => "searches#search"
    resources :operation_systems, only: [:show]
    resources :central_processing_units, only: [:show]
    resources :certifications, only: [:show]
    resources :specs, only: [:show]
    resources :makars, only: [:show]
    resources :capacities, only: [:show]
  end
  
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
  
  # 管理者で使用するルーティング
  namespace :admin do
    root to: "homes#top"
    
    resources :items, only: [:new, :create, :show, :edit, :update]
    resources :categories, only: [:index]
    resources :users, only: [:index, :show, :edit, :update]
    
    # カテゴリー操作
    resources :operation_systems, only: [:create, :edit, :update]
    resources :central_processing_units, only: [:create, :edit, :update]
    resources :certifications, only: [:create, :edit, :update]
    resources :specs, only: [:create, :edit, :update]
    resources :makars, only: [:create, :edit, :update]
    resources :capacities, only: [:create, :edit, :update]
    
    get "search" => "searches#search"
  end
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
