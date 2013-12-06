namespace :hourly_likes do
  desc "Like photos based on user's hashtags every hour"
  task :hashtag_likes => [:environment, :dotenv] do
    begin

      # Check whether we should activate inactive users
      User.inactive.each do |user|
        user.activate! if user.should_be_active?
      end

      # Like photos for all active users
      User.active.each do |user|
        if user.hashtags_to_like.any?
          @liker = InstagramLiker.new(user)
          puts "Liking #{user.full_name}'s photos on Instagram..."
          @liker.like_random_tagged_media
        end
      end
    rescue => e

      puts "Something went wrong: #{e}"

      # If it fails deactivate all users
      User.update_all(deactivate_instagram: Time.zone.now)

      # Email error and time of deactivation
      Mailer.error_notification(e, Time.zone.now).deliver
    end
    puts "Done."
  end
end
