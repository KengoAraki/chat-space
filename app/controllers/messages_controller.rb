class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    if @message.save
      redirect_to group_messages_path(@message.group_id), notice: "メッセージが投稿されました"
    else
      flash.now[:alert] = "メッセージが投稿されませんでした"
      render action: :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
