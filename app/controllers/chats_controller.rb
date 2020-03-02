class ChatsController < ApplicationController
  def index
    @category = Category.paginate(page: params[:page],per_page: 5)
    @p = Category.ransack(params[:p],search_key: :p)
    @categories = @p.result(distinct: true).paginate(page: params[:page],per_page: 5)
    @check = params[:p]
    @q = Group.ransack(params[:q])
    @groups = @q.result(distinct: true).paginate(page: params[:page],per_page: 5)
    @checks = params[:q]
    @favorites = Favorite.where(user_id: current_user.id)
  end
end
