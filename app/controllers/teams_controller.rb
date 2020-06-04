class TeamsController < ApplicationController
	def index

	end

	def show

	end

	def new

	end

	def edit

	end

	def update

	end

  def create

  end

  def destroy

  end

	private

	  def team_params
	  	params.require(:team).permit(:name, :is_status, :place, :introduction, :team_image, :url)
	  end
end
