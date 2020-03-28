class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @programminglogs = @user.programminglogs
  end

  def create
    if current_user.create(user_params)
      respond_to programminglogs_path
    else
      render :new_user_registration_path
    end
  end
  
  def edit
    
  end

  def update
    if current_user.update(user_params)
      respond_to programminglogs_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
