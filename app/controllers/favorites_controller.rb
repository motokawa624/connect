class FavoritesController < ApplicationController
  # fab作成
  def create
  	# buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
  	favorite = current_user.favorites.build(team_id: params[:team_id])
  	favorite.save
  	redirect_to request.referer
  end
  # fab削除
  def destroy
  	favorite = Favorite.find_by(team_id: @team.id, user_id: current_user.id)
  	favorite.destroy
  	redirect_to request.referer
  end

    private
  def redirect
    case params[:redirect_id].to_i
    when 0
      redirect_to teams_path
    when 1
      redirect_to team_path(@team)
    end
  end
end
