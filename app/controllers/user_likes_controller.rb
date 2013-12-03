class UserLikesController < ApplicationController
  def index
    @user_likes = current_user.user_likes
    @user_like = UserLike.new
  end

  def create
    instagram_user = current_user.user_likes.create(user_likes_params)
    instagram_user.build_from_instagram(instagram_user.username)
    redirect_to user_likes_path
  end

  def destroy
    user_like = UserLike.find(params[:id])
    user_like.destroy
    redirect_to user_likes_path
  end

  private

  def user_likes_params
    params.require(:user_like).permit(:username)
  end
end
