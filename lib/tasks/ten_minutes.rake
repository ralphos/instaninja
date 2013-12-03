namespace :ten_minutes do
  desc "Like photos based on user's hashtags every 10 minutes"
  task :like_on_instagram => [:environment, :dotenv] do
    begin
      User.all.each do |user|
        @liker = InstagramLiker.new(user)
        puts "Liking #{user.full_name}'s photos on Instagram..."
        @liker.like_all_tagged_media
      end
    rescue => e
      puts "Something went wrong: #{e}"
      Mailer.error_notification(e).deliver
    end
    puts "Done."
  end
end
