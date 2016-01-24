class UsersController < ApplicationController
  def add_tag
  	tag = Tag.find(params[:tag_id])
  	current_user.tags << tag
  	render json: tag
  end

  def remove_tag
  	tag = Tag.find(params[:tag_id])
  	TagUser.find_by(tag_id: params[:tag_id], user_id: current_user.id).delete
  	render json: tag
  end
end
