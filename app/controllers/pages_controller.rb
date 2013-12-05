class PagesController < ApplicationController
  include HighVoltage::StaticPage

  before_action :authenticate_for_production

  private
  def authenticate_for_production
    if Rails.env.production?
      http_basic_authenticate_with name: 'instaninja', password: 'password'
    end
  end
end
