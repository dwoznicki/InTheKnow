class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.html {redirect_to root_path}
      else
        format.html {render 'new'}
      end
    end
  end

  def edit
    @message = Message.find(params['message_id'])
  end

  def update
  end

  private
  def message_params
    params.require(:message).permit(:body, :start_date)
  end
end
