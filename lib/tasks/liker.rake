desc "Like photos based on user's hashtags every 10 minutes"
task :like_on_instagram => [:environment, :dotenv] do
  user = User.where(uid: '299043').first
  liker = InstagramLiker.new(user)
  puts "Liking all tagged photos on Instagram..."
  liker.like_all_tagged_media
  puts "Done."
end
