class TeamsController < ApplicationController
  before_action :authenticate_user!
	def index
    if params[:user_id]
      #マイチーム
      @teams = Team.where(user_id: params[:user_id])
    else
      #全チーム
		  @teams = Team.all
    end
	end

	def show
		@team = Team.find(params[:id])
    @belongs = Belong.where(team_id: params[:id])
    # binding.pry
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
    	@teams = Team.all
      render 'index'
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

  def myteam
  	@teams = current_user.teams
  end

	private

  def team_params
  	params.require(:team).permit(:name, :is_status, :place, :introduction, :team_image, :url, :tag_list)
  end

end
