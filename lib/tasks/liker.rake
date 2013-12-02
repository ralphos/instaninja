desc "Like photos based on user's hashtags every 10 minutes"
task :like_on_instagram => [:environment, :dotenv] do
  # Change this to iterate through all users
  puts "Liking all tagged photos on Instagram..."
  begin
    User.all.each do |user|
      liker = InstagramLiker.new(user)
      liker.like_all_tagged_media
    end
  rescue => e
    puts "Something went wrong: #{e}"
    Mailer.error_notification(e).deliver
  end
  puts "Done."
end
