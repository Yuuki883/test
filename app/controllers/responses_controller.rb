class ResponsesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @response = Response.new(response_params)
    @response.user_id = current_user.id
    @response.topic_id = params[:topic_id]
    if @response.save
      redirect_to topic_path(@topic)
    else
      @responses = Response.where(topic_id: @topic.id)
    end
  end

  private
  def response_params
    params.require(:response).permit(:name, :body)
  end
end
