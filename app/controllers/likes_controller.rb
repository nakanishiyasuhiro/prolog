class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, programminglog_id: params[:programminglog_id])
    @likes = Like.where(programminglog_id: params[:programminglog_id])
    @programminglogs = Programminglog.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, programminglog_id: params[:programminglog_id])
    like.destroy
    @likes = Like.where(programminglog_id: params[:programminglog_id])
    @programminglogs = Programminglog.all
  end
end
