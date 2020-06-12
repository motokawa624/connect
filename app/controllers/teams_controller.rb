class TeamsController < ApplicationController
	def index
		@teams = Team.all
	end

	def show
		@team = Team.find(params[:id])
		user = current_user
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
    redirect_to myteam_path
  end

  def myteam
  	@teams = Team.all
  end

	private

	  def team_params
	  	params.require(:team).permit(:name, :is_status, :place, :introduction, :team_image, :url, :tag_list)
	  end
end
