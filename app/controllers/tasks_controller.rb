class TasksController < ApplicationController
  def index
    @task = Task.new
    @room = Room.find(params[:room_id])
    @tasks = @room.tasks.includes(:user).order(limit: "ASC")
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
    @task = Task.find(params[:id])
    @room = @task.room_id
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to room_tasks_path(@task.room_id)
    else
      render :edit
    end
  end

  def destroy
   @task = Task.find(params[:id])
   @task.destroy
   redirect_to room_tasks_path(@task.room_id)
  end

  def show
    @task = Task.find(params[:id])
    @room = @task.room_id
    @room_info = Room.find(@room)
  end

  private

  def task_params
    params.require(:task).permit(:status,:limit,:task_name).merge(user_id: current_user.id)
  end
end