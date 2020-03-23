class LikesController < ApplicationController

  before_action :set_programminglog, only: [:create, :destroy]

  def index
    @all_ranks = Programminglog.find(Like.group(:programminglog_id).order('count(programminglog_id) desc').limit(100).pluck(:programminglog_id))
  end

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
