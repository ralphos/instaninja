desc "Like photos based on user's hashtags every 10 minutes"
task :like_on_instagram => [:environment, :dotenv] do
  # Change this to iterate through all users
  user = User.where(uid: '685791797').first
  liker = InstagramLiker.new(user)
  puts "Liking all tagged photos on Instagram..."
  begin
    liker.like_all_tagged_media
  rescue => e
    puts "Something went wrong: #{e}"
    Mailer.error_notification(e).deliver
  end
  puts "Done."
end
