class FavoritesController < ApplicationController
  before_action :favorite_task
  before_action :authenticate_user! 

  def create
      @favorite = Favorite.create(user_id: current_user.id, task_id: @task.id)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, task_id: @task.id)
    @favorite.destroy
  end

  private
  def favorite_task
    @task = Task.find(params[:task_id])
  end
end
