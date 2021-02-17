class Api::MessagesController < ApplicationController

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    messages = @conversation.messages

    messages.where("user_id != ? AND read = ?", params[:user_id], false).update_all(read: true)

    user_info = messages.select("messages.*, users.name as name").joins("INNER JOIN users ON messages.user_id = users.id")

    render json: {messages: messages, user_info: user_info}
  end

  def create
    message = @conversation.messages.create!(message_params)

    render json: message
  end

  private
    def message_params
      params.require(:message).permit(:content, :user_id, :conversation_id)
    end
end