class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def show
    @task = Task.find(params[:id])
    # binding.pry
  end

  def new
    @task = Task.new
  end

  # save!のように、語尾に！を付けることで例外処理を書くことができる。これをトリガーにロールバックしたり、など。
  def create
    task = Task.new(task_params)
    task.save!
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private
  # paramsは、viewでフォームに入力された情報が入っている変数
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
