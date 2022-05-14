class Admin::UsersController < ApplicationController
  def index
    @users = User.includes(:tasks)
    # @user = User.all
    # unless current_user.try(:admin?)
    #   redirect_to tasks_path, notice: "管理者以外は立ち入り禁止です！"
    # end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザー情報を編集しました！"
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "ユーザーを作成しました！"
    else
      render new_admin_user_path
    end
  end

  def show
   user = User.find(params[:id])
   id = user.id
   @tasks = Task.where(user_id: id)
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin)
  end
end
