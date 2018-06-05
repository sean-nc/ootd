Rails.application.routes.draw do
  root            'static_pages#home'
  devise_for      :users
  resources       :relationships,   only: [:create, :destroy]
  resources       :users,           only: [:index, :show] do
    member do
      get         :following, :followers
    end
    resources     :posts,           only: [:show, :new, :create, :destroy] do
      resources   :comments,        only: [:new, :create, :destroy]
    end
  end
end
