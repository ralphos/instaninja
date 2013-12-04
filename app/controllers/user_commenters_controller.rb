class UserCommentersController < ApplicationController
  def index
    @user_commenters = current_user.user_commenters
    @user_commenter= UserCommenter.new
  end

  def create
    instagram_user = current_user.user_commenters.create(user_commenters_params)
    instagram_user.build_from_instagram(instagram_user.username)
    redirect_to user_commenters_path
  end

  def destroy
    user_commenter = UserCommenter.find(params[:id])
    user_commenter.destroy
    redirect_to user_commenters_path
  end

  private

  def user_commenters_params
    params.require(:user_commenter).permit(:username)
  end
end
