Rails.application.routes.draw do

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
  resources :teams, only: [:show, :new, :edit, :update, :create ,:destroy] do
    resource :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :belongs, only: [:update]
  get 'home' => 'teams#index'
  get 'myteam' => 'teams#myteam'



  post 'contact/:id' => 'contact#create'

end
