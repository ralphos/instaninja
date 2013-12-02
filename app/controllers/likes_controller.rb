class LikesController < ApplicationController
  def create
    liker = InstagramLiker.new(current_user)
    liker.like_all_tagged_media
    redirect_to hashtags_path, notice: 'Photos on Instagram have been liked.'
  end
end
