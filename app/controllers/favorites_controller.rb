class FavoritesController < ApplicationController
  # fab作成
  def create
  	# buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
  	@favorite = current_user.favorites.new(team_id: params[:team_id])
  	@favorite.save
  end
  # fab削除
  def destroy
  	@favorite = Favorite.find_by(team_id: params[:team_id], user_id: current_user.id)
  	@favorite.destroy
  end

end
