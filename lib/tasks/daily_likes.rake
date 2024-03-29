namespace :daily_likes do
  desc "Like influential Instagrammer's latest photo once a day"
  task :like_users_photo => [:environment, :dotenv] do
    begin
      User.active.each do |user|
        if user.user_likes.any?
          user.user_likes.each do |ul|
            puts "Liking #{ul.username}'s last photo..."
            ul.like_last_photo
            sleep(rand(1..15))
          end
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
