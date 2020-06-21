# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, only: %i[edit update]
  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @current_user_rooms = UserRoom.where(user_id: current_user.id)
    @user_user_rooms = UserRoom.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_user_rooms.each do |cu|
        @user_user_rooms.each do |u|
          if cu.room_id == u.room_id
            @is_room = true
            @room_id = cu.room_id
          end
        end
      end
    end
    unless @is_room
      @room = Room.new
      @user_room = UserRoom.new
    end
    # ユーザーが所属しているチームの表示
    @teams = Team.where(owner_user_id: @user.id)
    team_ids = Belong.where(user_id: @user.id).pluck(:team_id)
    teams = Team.find(team_ids)
    @teams += teams
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :place, :introduction, :profile_image, :url)
  end

  def screen_user
    redirect_to user_path(current_user) unless params[:id].to_i == current_user.id
  end
end
