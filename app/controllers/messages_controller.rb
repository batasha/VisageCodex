class MessagesController < ApplicationController
  def index
    @unread_messages = current_user.messages.where(status: "unread")
    @read_messages = current_user.messages.where(status: "read")
    @sent_messages = current_user.sent_messages
  end

  def new
    @user = current_user
    @message = @user.sent_messages.build
  end

  def create
    @user = User.find(params[:user_id])
    @message = current_user.sent_messages.build(params[:message])
    @message.status = "unread"
    debugger

    if @message.save!
      redirect_to user_messages_path
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end
end