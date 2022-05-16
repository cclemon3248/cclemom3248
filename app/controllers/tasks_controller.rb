class TasksController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sort_expired]
      @tasks = current_user.tasks.page(params[:page]).per(5).order(deadline: :DESC)
    elsif params[:sort_priority]
      @tasks = current_user.tasks.page(params[:page]).per(5).order(priority: :DESC)
    else
      @tasks = current_user.tasks.page(params[:page]).per(5).order(created_at: :DESC)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
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
      @tasks = current_user.tasks.top3(params[:task][:title], params[:task][:status])
    elsif params[:task][:title]
      @tasks = current_user.tasks.top1(params[:task][:title])
    elsif params[:task][:status]
      @tasks = current_user.tasks.top2(params[:task][:status])
    else
      @tasks = current_user.tasks
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