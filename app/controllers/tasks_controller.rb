
class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    # 検索オブジェクト
    @search = Task.ransack(params[:q])
    # 検索結果
    @tasks = @search.result
  end

  def search_params
    params.require(:q).permit(:task_id_eq)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      redirect_to @task, notice: 'task created'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      # 更新が成功した場合（◆メッセージが表示されない）
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "タスク更新をしました" }
        format.json { render :show, status: :ok, location: @task }
      # 更新が失敗した場合（◆メッセージが表示されない）
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprossable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "削除しました" }
      format.json { head :no_content }
    end
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :status, :deadline_at)
  end
end