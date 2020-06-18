# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!
  # fab作成
  def create
    @favorite = current_user.favorites.new(team_id: params[:team_id])
    @favorite.save
  end

  # fab削除
  def destroy
    @favorite = Favorite.find_by(team_id: params[:team_id], user_id: current_user.id)
    @favorite.destroy
  end
end
