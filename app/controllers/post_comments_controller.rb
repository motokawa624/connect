class PostCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @team = Team.find(params[:team_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.team_id = @team.id
    comment.save
    @post_comment = PostComment.new
  end
  def destroy
    @team = Team.find(params[:team_id])
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
  end

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
