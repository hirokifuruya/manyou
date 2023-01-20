class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
      @tasks = current_user.tasks.order(created_at: :desc).page(params[:page]).per(5)
      if params[:task_name].present?
        @tasks = @tasks.get_by_task_name params[:task_name]
      end
      if params[:status].present?
        @tasks = @tasks.get_by_status params[:status]
      end
      if params[:deadline].present?
        @tasks = @tasks.reorder(deadline: :desc)
      end
      if params[:priority]
        @tasks = @tasks.desc_sort
      end
    end

    def new
        @task = Task.new
    end

    #def confirm
      #@task = current_user.tasks.build(task_params)
      #render :new if @task.invalid?
    #end

    def create
      @task = Task.new(task_params)
      @task.user_id = current_user.id
      if @task.save
          flash[:notice] = "作成しました！"
          redirect_to tasks_path
      else
          render :new
      end
    end

    def edit
      #@task = task.find(params[:id])
    end


    def show
      #@task = task.find(params[:id])
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

  private

    def task_params
      params.require(:task).permit(:task_content, :task_name, :deadline, :status, :priority)
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end

    def sort_column
      Task.column_names.include?(params[:sort]) ? params[:sort] : 'id'
    end
end
