class TasksController < ApplicationController
  
  before_action :find_task, only: [:show, :edit, :update, :destroy]


  def index 
    #views/tasks/index.html.erb or haml

    @tasks = Task.all.order("created_at DESC")
  end

  def show
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      redirect_to @task
    else
      render "New"
    end  
  end

  def update
    if @task.update(tasks_params)
      redirect_to @task
    else #if update fails, render edit again
      render "Edit"
    end
  end

  def edit
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end
  
  private

  def tasks_params
    #task model, and be sure to permit the different model attributes
    params.require(:task).permit(:title, :description, :company, :url)
  end
  
  def find_task
    @task = Task.find(params[:id])
  end

end
