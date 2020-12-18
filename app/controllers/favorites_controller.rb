class FavoritesController < ApplicationController
  before_action :authenticate_user! 

  def create
      @task = Task.find(params[:task_id])
      @favorite = Favorite.create(user_id: current_user.id, task_id: @task.id)
      redirect_to room_tasks_path(@task.room_id)
  end

  def destroy
    @task = Task.find(params[:id])
    @favorite = Favorite.find_by(user_id: current_user.id, task_id: @task.id)
    @favorite.destroy
    redirect_to root_path
  end
  

end
