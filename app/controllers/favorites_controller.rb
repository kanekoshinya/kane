class FavoritesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @favorite = current_user.favorites.create(group_id: params[:group_id])
    redirect_to group_messages_path(@group)
  end

  def destroy
    @favorite = Favorite.find_by(group_id:params[:group_id],user_id: current_user.id)
    @favorite.destroy
    @group = Group.find(params[:group_id])
    redirect_to group_messages_path(@group)
  end
end
