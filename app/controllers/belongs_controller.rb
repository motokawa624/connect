class BelongsController < ApplicationController
before_action :authenticate_user!
  def update
  end

  def create
    @team = Team.find(params[:team_id])
  	@belong = current_user.belongs.new(team_id: params[:team_id])
  	@belong.save
    redirect_to @team
  end

  def destroy
    @team = Team.find(params[:team_id])
  	@belong = Belong.find_by(team_id: params[:team_id], user_id: current_user.id)
  	@belong.destroy
    redirect_to @team
  end

end
