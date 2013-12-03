class UserLike < ActiveRecord::Base
  belongs_to :user

  def build_from_instagram(username)
    searcher = InstagramSearcher.new(self.user)
    instagram_user = searcher.user_search(username)
    self.uid, self.profile_picture = instagram_user[:uid], instagram_user[:profile_picture]
    self.save
  end

  def like_last_photo
    liker = InstagramLiker.new(self.user)
    photo = liker.get_users_last_photo(self.uid)
    liker.like_media(photo['id'])
  end
end
