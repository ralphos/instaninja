class InstagramFollower
  def initialize(user)
    @user = user
    @client = Instagram.client(client_id: nil, client_secret: nil, access_token: user.token)
  end

  def follow_last_photo_commenter(instagram_id)
    ig_uid = get_users_last_commenter_id(instagram_id)
    if !ig_uid.nil?
      @client.follow_user(ig_uid)
      @user.follows.create(uid: ig_uid)
    end
  end

  def get_users_last_commenter_id(instagram_id)
    photo = @client.user_recent_media(instagram_id, count: 1).first
    if photo['comments']['data'].any?
      photo['comments']['data'].last['from']['id']
    else
      nil
    end
  end

  def unfollow_user(ig_uid)
    @client.unfollow_user(ig_uid)
    @user.follows.where(uid: ig_uid).first.destroy
  end
end
