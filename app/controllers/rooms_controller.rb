# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_room, only: [:show]

  def create
    # room及び子モデルのuser_roomをcreate
    @room = Room.create
    UserRoom.create(room_id: @room.id, user_id: current_user.id)
    user_room = UserRoom.new(room_params)
    user_room.room_id = @room.id
    user_room.save
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    # .notでカレントユーザー以外の一人を取得
    @user_room = @room.user_rooms.where.not(user_id: current_user.id).last
    @user = @user_room.user
    # カレントユーザーに紐づいたチャットルームを探す。
    if UserRoom.where(user_id: current_user.id, room_id: @room.id).present?
      @chats = @room.chats
      @chat = Chat.new(room_id: @room.id)
      @user_rooms = @room.user_rooms
    else
      redirect_to users_path
    end
  end

  private

  def room_params
    params.require(:user_room).permit(:user_id)
  end

  def screen_room
    @room = Room.find(params[:id])
    # 現在のユーザーとチャットしているユーザーのルームを他者に見られない様にする。
    redirect_to home_path unless current_user && @room.user_rooms.where.not(user_id: current_user.id).take
  end
end
