namespace :daily_unfollows do
  desc "Unfollow follows that are over a week old"
  task :unfollow_commenter => [:environment, :dotenv] do
    begin
      User.active.each do |user|
        ig_follower = InstagramFollower.new(user)
        user.follows.each do |f|
          if (Time.zone.now - f.created_at) > 1.week
            puts "Unfollowing any follows over a week old"
            ig_follower.unfollow_user(f.uid)
          end
        end
        puts "Task Completed."
      end
    rescue => e
      puts "Something went wrong: #{e}"

      # If it fails deactivate all users
      User.update_all(deactivate_instagram: Time.zone.now)

      Mailer.error_notification(e).deliver
    end
  end
end
