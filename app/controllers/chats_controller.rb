class ChatsController < ApplicationController
  def index
    @category = Category.paginate(page: params[:page],per_page: 5)
    @q = Group.ransack(params[:q])
    @groups = @q.result(distinct: true).paginate(page: params[:page],per_page: 5)
      
  end
end
