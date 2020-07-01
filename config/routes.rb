# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#top'

  # ユーザーログインルーティング
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # ログイン及び新規登録時は、必ずcollbackを参照させる
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # ユーザールーティング
  resources :users, only: %i[index show edit update] do
    resource :relationships, only: %i[create destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  # チャットルーティング
  resources :rooms, only: %i[create show]
  resources :chats, only: [:create]

  # チームルーティング
  resources :teams, only: %i[index show new edit update create destroy] do
    resources :post_comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
    resource :belongs, only: %i[create destroy]
  end

  get 'home' => 'teams#home'

  get 'thanks' => 'contacts#thanks'

  resources :contacts, only: %i[new create]
end
