class TaskController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @task = Task.all
  end

  def new
    if params[:back]
      @task = task.new(task_params)
    else
      @task = task.new
    end
  end

  def confirm
    @task = current_user.tasks.build(task_params)
    render :new if @task.invalid?
  end

  def create
    @task = task.new(task_params)
    @task = current_user.tasks.build(task_params)
    if params[:back]
      render :new
    else
      if @task.save
        #taskMailer.task_mail(@task).deliver
        redirect_to tasks_path, notice: "作成しました！"
      else
        render :new
      end
    end
  end

  def edit
    @task = task.find(params[:id])
    if @task.user_id == current_user.id
      render :edit
    else
      redirect_to tasks_path
    end
  end


  def show
  end


  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"削除しました！"
  end

  def confirm
    @task = current_user.tasks.build(task_params)
    render :new if @task.invalid?
  end

private

  def task_params
    params.require(:task).permit(:content, :name)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end