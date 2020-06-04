class PostCommentsController < ApplicationController
  def create

  end
  def destroy

  end

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
