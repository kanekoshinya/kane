class ChatsController < ApplicationController
  def index
    @category = Category.all
  end
end
