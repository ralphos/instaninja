namespace :daily_follows do
  desc "Follow the last commenter of an influential Instagrammer once per day"
  task :follow_commenter => [:environment, :dotenv] do
    begin
      User.active.each do |user|
        ig_follower = InstagramFollower.new(user)
        user.user_commenters.each do |uc|
          puts "Following #{uc.username}'s last commenter..."
          ig_follower.follow_last_photo_commenter(uc.uid)
          puts "Followed."
        end
      end
      puts "Task Completed."
    rescue => e
      puts "Something went wrong: #{e}"

      # If it fails deactivate all users
      User.update_all(deactivate_instagram: Time.zone.now)

      Mailer.error_notification(e).deliver
    end
  end
end
