class InstagramLiker
  def initialize(user)
    @hashtags = user.hashtags_to_like
    @client = Instagram.client(client_id: nil, client_secret: nil, access_token: user.token)
  end

  def like_random_tagged_media
    random_media = get_random_media_sample
    random_media.each do |id|
      puts "Request number: #{random_media.index(id) + 1}"
      like_media(id)
      sleep(rand(1..20))
    end
  end

  def get_random_media_sample
    media = get_all_tagged_media_ids
    media.sample(rand(0..media.count))
  end

  def get_all_tagged_media_ids
    @hashtags.map { |tag| tagged_media_ids(tag) }.flatten
  end

  def get_users_last_photo(instagram_id)
    @client.user_recent_media(instagram_id, count: 1).first
    # check if user_has_liked isn't false
  end

  def tagged_media(hashtag)
    @client.tag_recent_media(hashtag, count: 1)
  end

  def tagged_media_ids(hashtag)
    tagged_media(hashtag).map(&:id)
  end

  def like_media(id)
    @client.like_media(id)
  end
end
