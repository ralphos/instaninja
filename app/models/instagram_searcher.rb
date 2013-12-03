class InstagramSearcher
  def initialize(user)
    @client = Instagram.client(access_token: user.token)
  end

  def user_search(username)
    user = @client.user_search(username, count: 1).first
    { uid: user['id'], profile_picture: user['profile_picture'] }
  end
end
