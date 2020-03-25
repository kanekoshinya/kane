class UsersController < ApplicationController

  def show
    @like = Like.where(user_id: current_user.id)
    @likes  = []
    @count = 1
    @counts = 0
    @like.each do |like|
    @message = Message.find(like.message_id)
    @likes << @message
    @counts += 1
    end
    @liked  = []
    @countd = 1
    @countdd = 0
    @likeuser = Message.where(user_id: current_user.id)
    @likeusers = Like.where(message_id: @likeuser.ids)
    @likeusers.each do |likes|
      @messages = Message.find(likes.message_id)
      @liked << @messages
      @countdd += 1
      end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name,:email)
  end
end
