class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    if @task.completed
      @display = 'The task is completed'
    else
      @display = 'The task is not completed yet'
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params[:task][:title].capitalize!
    params[:task][:details].capitalize!
    params.require(:task).permit(:title, :details, :completed)
  end
end
