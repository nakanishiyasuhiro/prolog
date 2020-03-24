class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to "/programminglogs/#{@comment.programminglog.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, programminglog_id: params[:programminglog_id])
  end
end

