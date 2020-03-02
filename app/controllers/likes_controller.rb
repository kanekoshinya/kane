class LikesController < ApplicationController
  
  protect_from_forgery :except => ["create"]

  def create
    @group = Group.find(params[:group_id])
    @like = current_user.likes.create(message_id: params[:message_id])
    redirect_to group_messages_path(@group)
  end

  def destroy
    @like = Like.find_by(message_id:params[:message_id],user_id: current_user.id)
    @like.destroy
    @group = Group.find(params[:group_id])
    redirect_to group_messages_path(@group)
  end
end
