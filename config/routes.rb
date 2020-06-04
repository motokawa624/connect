Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
      get 'follows' => 'relationships#follower', as: 'follows'
      get 'followers' => 'relationships#followed', as: 'followers'
  end

  resources :teams
  get 'myteam' => 'teams#myteam'
  resources :post_comments, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :belongs, only: [:update]
  get 'chat/:id' => 'chat#show', as: 'chat'
  post 'contact/:id' => 'contact#create'

end
