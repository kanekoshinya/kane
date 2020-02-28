class GroupsController < ApplicationController

  def index
    @category =  Category.find(params[:category_id])
    @group = Group.where(category_id:params[:category_id]).paginate(page: params[:page],per_page: 5)
    @q = Group.ransack(params[:q])
    @groups = @q.result(distinct: true).paginate(page: params[:page],per_page: 5)
    @check = params[:q]
  end

  def new
    @groups = Group.all
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @groups = Group.where(group_id:params[:group_id])
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
