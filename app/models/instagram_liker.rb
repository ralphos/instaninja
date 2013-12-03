class InstagramLiker
  def initialize(user)
    @hashtags = user.hashtags_to_like
    @client = Instagram.client(client_id: nil, client_secret: nil, access_token: user.token)
  end

  def like_all_tagged_media
    count = 0
    get_all_tagged_media_ids.each do |tm|
      tm.each do |id|
        count += 1
        puts "Request count: #{count}"
        like_media(id)
      end
    end
  end

  def get_all_tagged_media_ids
    @hashtags.map { |tag| tagged_media_ids(tag) }
  end

  def get_users_last_photo(instagram_id)
    @client.user_recent_media(instagram_id, count: 1).first
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
