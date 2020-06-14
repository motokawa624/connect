class TeamsController < ApplicationController
	def index
		@teams = Team.all
	end

	def show
		@team = Team.find(params[:id])
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
  	@team = Team.new(team_params)
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
    PostComment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
    redirect_to myteam_path
  end

  def myteam
  	@teams = current_user.teams
  end

	private

	  def team_params
	  	params.require(:team).permit(:name, :is_status, :place, :introduction, :team_image, :url, :tag_list)
	  end
end
