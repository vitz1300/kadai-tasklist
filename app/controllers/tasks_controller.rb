class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :update, :show, :edit]
  

  def index
      @task=current_user.tasks
  end

  def show
  end

  def new
    if logged_in?
      @task = current_user.tasks.build
    end
  end

  def create
      
      @task=current_user.tasks.build(task_params)
      
      if @task.save
        flash[:success] = 'タスクが正常に投稿されました'
        redirect_to @task
      else
        flash.now[:danger] = 'タスクが正常に投稿されませんでした'
        render :new
      end
  end
  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクが正常に投稿されませんでした'
      render :new
    end
  end
  def destroy
    @task.destroy
    
    flash[:success]='タスクは正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  def task_params
      params.require(:task).permit(:content, :status)
  end
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
