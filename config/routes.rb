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
      resource :area_comments, only: [:create, :destroy]
    end
    get 'favorites/index'
  end

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
