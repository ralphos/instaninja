class UsersController < ApplicationController
  def update
    current_user.update(user_params)
    redirect_to hashtags_path
  end

  private

  def user_params
    params.require(:user).permit(:likes_per_hashtag)
  end
end
