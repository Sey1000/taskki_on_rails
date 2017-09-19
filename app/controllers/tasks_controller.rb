class TasksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :due)
  end
end
