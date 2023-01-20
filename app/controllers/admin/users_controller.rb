class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user

  def index
    @users = User.all.includes(:tasks)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
        render :new
    end
  end

  def edit
  end

  def show
    @tasks = Task.where(user_id: @user.id)
  end

  def update
    if @user.uptate(user_params)
      redirect_to admin_user_path, notice: "更新しました。"
    else
        render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_user_path, notice: "削除しました。"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
    if unless current_user.admin?
      redirect_to(root_url)
      flash[:notice] = "アクセス権限がありません"
    end
    end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
  end
end
