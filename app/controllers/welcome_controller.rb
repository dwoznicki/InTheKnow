class WelcomeController < ApplicationController
  def index
  	@tags = Tag.all - current_user.tags
  	@messages = current_user.messages.order(start_date: :desc)
  end
end
