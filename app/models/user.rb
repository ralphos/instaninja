class User < ActiveRecord::Base
  has_many :hashtags, dependent: :destroy
  has_many :user_likes, dependent: :destroy
  has_many :user_commenters, dependent: :destroy
  has_many :follows, dependent: :destroy

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

  def self.active
    where(deactivate_instagram: nil)
  end

  def self.inactive
    where("deactivate_instagram is NOT NULL")
  end

  def inactive?
    !deactivate_instagram.nil?
  end

  def should_be_active?
    Time.zone.now > activation_time
  end

  def activate!
    self.deactivate_instagram = nil
    self.save
  end

  def activation_time
    self.deactivate_instagram.tomorrow.to_date.to_time
  end

  def hashtags_to_like
    hashtags.map(&:name)
  end
end
