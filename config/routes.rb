Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root 'home#top'

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
      get 'follows' => 'relationships#follower', as: 'follows'
      get 'followers' => 'relationships#followed', as: 'followers'
  end

  resources :teams, only: [:show, :new, :edit, :update, :create ,:destroy]
  get 'home' => 'teams#index'
  get 'myteam' => 'teams#myteam'
  resources :post_comments, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :belongs, only: [:update]
  get 'chat/:id' => 'chat#show', as: 'chat'
  post 'contact/:id' => 'contact#create'

end
