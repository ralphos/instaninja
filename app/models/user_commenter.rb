class UserCommenter < ActiveRecord::Base
  belongs_to :user

  def build_from_instagram(username)
    searcher = InstagramSearcher.new(self.user)
    instagram_user = searcher.user_search(username)
    self.uid, self.profile_picture = instagram_user[:uid], instagram_user[:profile_picture]
    self.save
  end
end
