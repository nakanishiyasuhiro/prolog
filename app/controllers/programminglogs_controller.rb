class ProgramminglogsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_programminglog, only: [:edit, :show]

  def index
    @programminglogs = Programminglog.includes(:user).order("created_at DESC")
  end
  def new
    @programminglog = Programminglog.new
  end
  def create
    # binding.pry
    Programminglog.create(programminglog_params)
    redirect_to programminglogs_path
  end
  def show
    @like = Like.new
    @comment = Comment.new
    @comments = @programminglog.comments.includes(:user)
  end
  def search
    @programminglogs = Programminglog.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end
  def edit
  end
  def update
    programminglog = Programminglog.find(params[:id])
    programminglog.update(programminglog_params)
    redirect_to programminglogs_path
  end
  def destroy
    programminglog = Programminglog.find(params[:id])
    programminglog.destroy
    redirect_to programminglogs_path
  end
  
  private
  def programminglog_params
    params.require(:programminglog).permit(:title, :image, :text, :tag_list).merge(user_id: current_user.id)
  end

  def set_programminglog
    @programminglog = Programminglog.find(params[:id])
  end


end
