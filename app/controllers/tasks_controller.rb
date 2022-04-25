class TasksController < ApplicationController
  before_action :set_blog, only: [:edit, :update]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to new_task_path, notice: "タスクを作成しました！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  private

  def set_blog
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :priority, :status)
  end
end