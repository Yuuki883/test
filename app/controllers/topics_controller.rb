class TopicsController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index
    @topic = Topic.new
    @q = Topic.ransack(params[:q])
    @topics = @q.result(distinct: true).page(params[:page]).per(5).order(created_at: :desc)
    @responses = @topic.responses
  end

  def show
    @topic = Topic.find(params[:id])
    @response = Response.new
    @responses = @topic.responses
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topic_path(@topic.id), notice: "スレッドを作成しました！"
    else
      render "new"
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to edit_topic_path(@topic.id), notice: "スレッドのタイトルを更新しました！"
    else
      render "edit"
    end
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to user_path(current_user), notice: "スレッドを削除しました"
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
  def correct_user
    topic = Topic.find(params[:id])
    if current_user.id != topic.user.id
      redirect_to topics_path
    end
  end
end
