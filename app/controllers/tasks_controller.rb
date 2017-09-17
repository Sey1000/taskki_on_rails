class TasksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @tasks = Task.all
  end
end
