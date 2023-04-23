Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'users/mypage' => 'users#show'
    patch 'users/mypage' => 'users#update'
    get 'users/mypage/edit' => 'users#edit'
    get 'users/unsubscribe'
    patch 'users/withdrawal'
    resources :areas, only: [:new, :create, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:index, :create, :destroy]
      resources :area_comments, only: [:create, :destroy]
    end
    get 'favorites/index'
    get 'area_comments/index'
    get "search" => "areas#search"
  end

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :areas, only: [:index, :show, :edit, :update, :destroy] do
      resources :area_comments, only: [:update, :destroy]
    end
  end

  scope module: :admin do
    resources :area_comments, only: [:index, :show, :edit]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
