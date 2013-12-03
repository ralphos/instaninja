namespace :daily do
  desc "Like influential Instagrammer's latest photo once a day"
  task :like_users_photo => [:environment, :dotenv] do
    begin
      User.all.each do |user|
        user.user_likes.each do |ul|
          puts "Liking #{ul.username}'s last photo..."
          ul.like_last_photo
          sleep(rand(1..5))
          puts "Liked."
        end
      end
      puts "Task Completed."
    rescue => e
      puts "Something went wrong: #{e}"
      Mailer.error_notification(e).deliver
    end
  end
end
