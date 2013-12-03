class InstagramLiker
  def initialize(user)
    @number_of_photos = user.likes_per_hashtag
    @hashtags = user.hashtags_to_like
    @client = Instagram.client(access_token: user.token)
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

  def tagged_media(hashtag)
    @client.tag_recent_media(hashtag, count: @number_of_photos)
  end

  def tagged_media_ids(hashtag)
    tagged_media(hashtag).map(&:id)
  end

  def like_media(id)
    @client.like_media(id)
  end
end
