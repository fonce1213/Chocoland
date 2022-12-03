Rails.application.routes.draw do
  namespace :public do
    get 'users/unsubscribe'
    get 'users/withdraw'
  end
  # 管理者用
  # URL /admin/...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    
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
    root 'post_items#top'
    get 'users/mypage' => 'users#show', as: 'mypage'
    get 'users/information/edit' => 'users#edit', as: 'edit_information'
    patch 'users/information' => 'users#update', as: 'update_information'
    
    resources :post_items, only: [:new, :create, :index, :show] do
      resource :bookmarks, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
