class HashtagsController < ApplicationController
  def index
    @hashtag = Hashtag.new
    @hashtags = current_user.hashtags
    @user = current_user
  end

  def create
    current_user.hashtags.create(hashtag_params)
    redirect_to hashtags_path
  end

  def destroy
    hashtag = Hashtag.find(params[:id])
    hashtag.destroy
    redirect_to hashtags_path
  end

  private

  def hashtag_params
    params.require(:hashtag).permit(:name)
  end
end
