class TasksController < ApplicationController
  def index
    @task = current_user.tasks
  end

  def show
    @task = current_user.tasks.find(params[:id])
    # binding.pry
  end

  def new
    @task = Task.new
  end

  # save!のように、語尾に！を付けることで例外処理を書くことができる。これをトリガーにロールバックしたり、など。

  # そしてリンク先のパスとしてモデルオブジェクトが渡された場合、
  # Railsはオブジェクトを一意に表す値、つまり、idを取得しようします。
  # だから最終的には、redirect_to @userは、redirect_to user_url(@user.id)と等価となります。
  # だから、以下のコードを実行するとsaveが成功した後は一覧画面じゃなくて、タスク詳細画面に行きます。
  #
  # topic = Topic.new
  # topic.user_id = current_user.id
  # #全く同じ
  # topic = current_user.topics.new (edited)

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    task = current_user.tasks.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private
  # paramsは、viewでフォームに入力された情報が入っている変数
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
