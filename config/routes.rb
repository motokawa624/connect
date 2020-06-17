Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#top'

  # ユーザーログインルーティング
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  # ユーザールーティング
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
      get 'follows' => 'relationships#follower', as: 'follows'
      get 'followers' => 'relationships#followed', as: 'followers'
  end
  # チャットルーティング
  resources :rooms, only: [:create, :show]
  resources :chats, only: [:create]

  # チームルーティング
  resources :teams, only: [:index, :show, :new, :edit, :update, :create ,:destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resource :belongs, only: [:create, :destroy]
  end
  
  get 'home' => 'teams#home'
  get 'myteam' => 'teams#myteam'



  post 'contact/:id' => 'contact#create'

end
