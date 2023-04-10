Rails.application.routes.draw do
  
  # 一般ユーザーで使用するルーティング
  scope module: :public do
    root to: 'homes#top'
    
    # 投稿記事関連
    resources :items, only: [:index, :show] do
      resource :interests, only: [:create, :destroy] do
        delete 'list_destroy' => 'interests#list_destroy'
      end
      resources :comments, only: [:new, :index, :edit, :update, :create] do
        resource :favorites, only: [:create, :destroy]
      end
      get 'compare/:item1_id/:item2_id' => 'items#compare', as: :compare
    end
    
    # ユーザー関連
    resource :users, only: [:show, :edit, :update] do
      get :check, on: :collection
      get :interests, on: :collection
      patch :withdrawal, on: :collection
    end
    
    # ユーザー側検索関連
    get "search" => "searches#search"
    resources :operation_systems, only: [:show]
    resources :makers, only: [:show]
  end
  
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  # ゲストユーザー用ルーティング
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  # 管理者で使用するルーティング
  namespace :admin do
    root to: "homes#top"
    
    # 投稿記事関連
    resources :items, only: [:new, :create, :show, :edit, :update] do
      resources :comments, only: [:index, :destroy]
    end
    
    resources :categories, only: [:index]
    resources :users, only: [:index, :show, :edit, :update]
    
    # カテゴリー操作
    resources :operation_systems, only: [:create, :edit, :update, :destroy]
    resources :central_processing_units, only: [:create, :edit, :update, :destroy]
    resources :authentications, only: [:create, :edit, :update, :destroy]
    resources :specs, only: [:create, :edit, :update, :destroy]
    resources :makers, only: [:create, :edit, :update, :destroy]
    resources :capacities, only: [:create, :edit, :update, :destroy]
    
    get "search" => "searches#search"
  end
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
