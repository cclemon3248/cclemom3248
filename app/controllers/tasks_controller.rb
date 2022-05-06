class TasksController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sort_expired]
      @tasks = Task.page(params[:page]).per(5).order(deadline: :DESC)
    elsif params[:sort_priority]
      @tasks = Task.page(params[:page]).per(5).order(priority: :DESC)
    else
      @tasks = Task.page(params[:page]).per(5).order(created_at: :DESC)
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
    if params[:task][:title] && params[:task][:status]
      @tasks = Task.top3(params[:task][:title], params[:task][:status])
    elsif params[:task][:title]
      @tasks = Task.top1(params[:task][:title])
    elsif params[:task][:status]
      @tasks = Task.top2(params[:task][:status])
    else
      @tasks = Task.all
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