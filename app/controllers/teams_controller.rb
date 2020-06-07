class TeamsController < ApplicationController
	def index
		@teams = Team.all
	end

	def show
		@team = Team.find(params[:id])
		user = current_user
	end

	def new
		@team = Team.new

	end

	def edit

	end

	def update

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

  def destroy

  end

	private

	  def team_params
	  	params.require(:team).permit(:name, :is_status, :place, :introduction, :team_image, :url, :tag_list)
	  end
end
