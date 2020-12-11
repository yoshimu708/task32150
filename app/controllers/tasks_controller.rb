class TasksController < ApplicationController
  def index
    @task = Task.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @task = @room.tasks.new(task_params)
    if @task.save
      redirect_to room_tasks_path(@room)
    else
      render :index
    end
  end

  private

  def task_params
    params.require(:task).permit(:task_name,:status,:limit).merge(user_id: current_user.id)
  end
end
