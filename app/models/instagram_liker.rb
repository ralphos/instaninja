class InstagramLiker
  def initialize(user)
    @hashtags = user.hashtags_to_like
    @client = Instagram.client(access_token: user.token)
  end

  def like_all_tagged_media
    get_all_tagged_media_ids.each do |tm|
      tm.each { |id| like_media(id) }
    end
  end

  def get_all_tagged_media_ids
    @hashtags.map { |tag| tagged_media_ids(tag) }
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
