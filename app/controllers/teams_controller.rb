class TeamsController < ApplicationController
  before_action :authenticate_user!
	def index
		@teams = Team.all
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
    if @team.update(team_params) # update ji no strong params ni kaeru
      redirect_to @team
    else
      render 'edit'
    end
	end
  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    PostComment.find_by(id: params[:id], team_id: params[:team_id]).destroy
    redirect_to myteam_path
  end

  def myteam
  	@teams = current_user.teams
  end

	private

  def team_params
  	params.require(:team).permit(:name, :is_status, :place, :introduction, :team_image, :url, :tag_list)
  end
  # def update_team_params
  #   params.require(:team).permit(:name, :is_status, :place, :introduction, :team_image, :url, :tag_list, :belongs [:belong, :_destroy, :id])
  # end
  # def update_article_params
  #   #update時は[_delete]と[id]が必要
  #   params.require(:article).permit(:title, images_attributes: [:content, :_destroy, :id])
  # end
end
