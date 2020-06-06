
class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    # 検索オブジェクト ＆ 検索結果
    @search = Task.ransack(params[:q])
    @tasks = @search.result.page(params[:page])
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
      flash[:notice] = "タスクを追加しました。"
      redirect_to @task
    else
      flash.now[:danger] = "登録に失敗しました。"
      render :new
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        flash[:notice] = "タスクを修正しました。"
        format.html { redirect_to @task, notice: "タスク更新をしました" }
        format.json { render :show, status: :ok, location: @task }
      else
        flash.now[:danger] = "更新に失敗しました。"
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprossable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      flash[:success] = "タスクを削除しました。"
      format.html { redirect_to tasks_url }
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