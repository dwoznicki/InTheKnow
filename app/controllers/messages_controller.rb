class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @tags = Tag.all
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        @message.tags << Tag.find(params[:message][:tag_id])
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
    params.require(:message).permit(:body, :start_date, :tag_id)
  end
end
