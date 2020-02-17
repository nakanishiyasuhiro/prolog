class ProgramminglogsController < ApplicationController


  def index
    @programminglogs = Programminglog.includes(:user)
  end
  def new
    @programminglog = Programminglog.new
  end
  def create
    Programminglog.create(programminglog_params)
    redirect_to programminglogs_path
  end
  def show
    @programminglog = Programminglog.find(params[:id])
  end
  
  private
  def programminglog_params
    params.require(:programminglog).permit(:title, :image, :text).merge(user_id: current_user.id)
  end

end
