class LikesController < ApplicationController

  before_action :set_programminglog

  def create
    @like = Like.create(user_id: current_user.id, programminglog_id: params[:programminglog_id])
    @likes = Like.where(programminglog_id: params[:programminglog_id])
    @programminglog.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, programminglog_id: params[:programminglog_id])
    like.destroy
    @likes = Like.where(programminglog_id: params[:programminglog_id])
    @programminglog.reload
  end

  private

  def set_programminglog
    @programminglog = Programminglog.find(params[:programminglog_id])
  end

end
