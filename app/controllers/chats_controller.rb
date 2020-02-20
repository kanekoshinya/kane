class ChatsController < ApplicationController
  def index
    @category = Category.all
    @group = Group.all
  end
end
