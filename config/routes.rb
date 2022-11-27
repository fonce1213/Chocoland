Rails.application.routes.draw do
  # ユーザー用
  # URL /users/...
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
    passwords: "public/passwords"
  }
  
  # 管理者用
  # URL /admin/...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
