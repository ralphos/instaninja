Rails.application.config.middleware.use OmniAuth::Builder do
  provider  :instagram, ENV['INSTAGRAM_ID'], ENV['INSTAGRAM_SECRET'],
    scope: 'likes relationships'
end
