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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin)
  end
end
