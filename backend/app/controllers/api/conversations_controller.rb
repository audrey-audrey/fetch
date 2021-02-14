class Api::ConversationsController < ApplicationController

  def index
    conversations = Conversation.where("initiator = ? OR recipient = ?", params["user_id"], params["user_id"])
    render json: conversations
  end

  def create
    conversation = Conversation.new(initiator: params["user_id"], recipient: params["recipient_id"])
    render json: conversation
  end
end
