class InstagramLiker
  def initialize(user)
    @hashtags = user.hashtags_to_like
    @client = Instagram.client(client_id: nil, client_secret: nil, access_token: user.token)
  end

  def like_random_tagged_media
    random_media = get_random_media_sample
    random_media.each do |photo|
      if photo['user_has_liked'] == false
        like_media(photo['id'])
        sleep(rand(1..20))
        puts "Liked"
      else
        puts "No likey"
      end
    end
  end

  def get_random_media_sample
    media = get_all_tagged_media
    media.sample(rand(1..media.count))
  end

  def get_all_tagged_media
    @hashtags.map { |tag| tagged_media(tag) }
  end

  def get_users_last_photo(instagram_id)
    @client.user_recent_media(instagram_id, count: 1).first
    # check if user_has_liked isn't false
  end

  def tagged_media(hashtag)
    @client.tag_recent_media(hashtag, count: 1).first
  end

  def like_media(id)
    @client.like_media(id)
  end
end
