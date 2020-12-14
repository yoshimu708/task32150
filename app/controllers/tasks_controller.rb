class TasksController < ApplicationController
  def index
    @task = Task.new
    @room = Room.find(params[:room_id])
    @tasks = @room.tasks.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @task = @room.tasks.new(task_params)
    if @task.save
      redirect_to room_tasks_path(@room)
    else
      @tasks = @room.tasks.includes(:user)
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
   @task = Task.find(params[:id])
   @task.destroy
   redirect_to room_tasks_path(@task.room_id)
  
  end

  private

  def task_params
    params.require(:task).permit(:status,:limit,:task_name).merge(user_id: current_user.id)
  end
end
