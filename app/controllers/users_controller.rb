class UsersController < ApplicationController

  def edit
  end


  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    favorites = Favorite.where(user_id: current_user.id).pluck(:task_id) 
    @favorite_list = Task.find(favorites)
  end
  
  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
