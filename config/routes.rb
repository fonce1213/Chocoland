Rails.application.routes.draw do
  # 管理者用
  # URL /admin/...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
  }
  
  namespace :admin do
    get 'top' => 'reviews#top', as: 'top'
    resources :post_items, only: [:show, :index, :destroy]
    resources :reviews, only: [:show, :index, :destroy]
    resources :users, only: [:show, :index, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    
  end

  # ユーザー用
  # URL /users/...
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
    passwords: "public/passwords"
  }
  
  # ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  scope module: :public do
    root 'reviews#top'
    get 'users/mypage' => 'users#show', as: 'mypage'
    get 'users/review_list' => 'users#index', as: 'review_list'
    get 'users/information/edit' => 'users#edit', as: 'edit_information'
    patch 'users/information' => 'users#update', as: 'update_information'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
    put 'users/withdraw' => 'users#withdraw'
    get 'post_items/bookmark_items' => 'post_items#bookmark_items', as: 'bookmarked'
    
    resources :users do
      resource :relationships, only: [:create, :destroy]
    end
    
    resources :post_items, only: [:new, :create, :index, :show, :edit, :update] do
      collection do
        get 'search'
      end
      resource :bookmarks, only: [:create, :destroy]
      resources :reviews, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
        resource :favorites, only: [:create, :destroy]
        resources :post_comments, only: [:create, :destroy]
      end
    end
    resources :tags, only: [:create] do
      get 'reviews', to: 'reviews#search'
    end
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
