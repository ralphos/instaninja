class PagesController < ApplicationController
  include HighVoltage::StaticPage
  if Rails.env.production?
    http_basic_authenticate_with name: 'instaninja', password: 'password'
  end
end
