class GroupsController < ApplicationController

  def index
    @group = Group.where(category_id:params[:category_id]).paginate(page: params[:page],per_page: 5)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end



  private
  def group_params
    params.require(:group).permit(:name,:category_id)
  end

end
