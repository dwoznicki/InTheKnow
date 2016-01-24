class UsersController < ApplicationController
  def add_tag
  	tag = Tag.find(params[:tag_id])
  	current_user.tags << tag
  	redirect_to root_path
  end

  def remove_tag
  	TagUser.find_by(tag_id: params[:tag_id], user_id: current_user.id).delete
  	redirect_to root_path
  end
end
