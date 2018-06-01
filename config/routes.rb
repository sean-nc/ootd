Rails.application.routes.draw do
  root            'static_pages#home'
  devise_for      :users
  resources       :relationships, only: [:create, :destroy]
  resources       :users, only: [:index, :show] do
    member do
      resources   :posts, only: [:show, :new, :create, :destroy]
      get         :following, :followers
    end
  end
end
