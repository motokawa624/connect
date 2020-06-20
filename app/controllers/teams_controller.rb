# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @teams = Team.page(params[:page]).reverse_order
  end

  def home
    # オーナーのチームと所属のチームidを配列で足し算する
    @teams = Team.where(owner_user_id: current_user.id)
    # 複数のidを取得してきてpluckで配列にする。
    team_ids = Belong.where(user_id: current_user.id).pluck(:team_id)
    teams = Team.find(team_ids)
    @teams += teams
  end

  def show
    @team = Team.find(params[:id])
    @belongs = Belong.where(team_id: params[:id])
    @team.belongs.build
    @post_comment = PostComment.new
    @post_comments = @team.post_comments
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = current_user.owner_teams.new(team_params)
    # @team = Team.new(team_params)
    #  @team.owner_user_id = current_user.id
    if @team.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to home_path
  end

  private

  def team_params
    params.require(:team).permit(:name, :is_status, :place, :introduction, :team_image, :url, :tag_list)
  end
end
