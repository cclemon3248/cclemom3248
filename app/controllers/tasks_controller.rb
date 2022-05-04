class TasksController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sort_expired]
      @tasks = Task.order(deadline: :DESC)
    else
      @tasks = Task.order(created_at: :DESC)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task.id), notice: "タスクを作成しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"ブログを削除しました！"
  end

  def search
    if params[:title] == true
      @tasks = Task.where("title LIKE ?", "%#{params[:title]}%")
    elsif params[:status] == true
      @tasks = Task.where("status LIKE ?", "%#{params[:status]}%")
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