class UsersController < ApplicationController
  def index
    @users = User.all
    
  end

  def show

  end

  def edit

  end

  def update

  end


  private

    def user_params
		params.require(:user).permit(:name, :email, :place, :introduction, :profile_image)
	end
end
