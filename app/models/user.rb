class User < ActiveRecord::Base
  has_many :hashtags

  def self.find_or_create_with_omniauth(auth_hash)
     where(auth_hash.slice('provider', 'uid')).first || create! do |auth|
      auth.uid = auth_hash['uid']
      auth.provider = auth_hash['provider']
      auth.username = auth_hash['info']['nickname']
      auth.full_name = auth_hash['info']['name']
      auth.profile_picture = auth_hash['info']['image']
      auth.token = auth_hash['credentials']['token']
    end
  end

  def hashtags_to_like
    hashtags.map(&:name)
  end
end
