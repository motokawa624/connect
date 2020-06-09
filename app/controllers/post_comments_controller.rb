class PostCommentsController < ApplicationController
  def create
    team = Team.find(params[:team_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.team_id = team.id
    comment.save
    redirect_to team_path(team)
  end
  def destroy

  end

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
