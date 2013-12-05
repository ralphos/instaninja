class PagesController < ApplicationController
  include HighVoltage::StaticPage

  before_action :authenticate

  def show
  end

  private
  def authenticate
    http_basic_authenticate_with name: 'instaninja', password: 'password'
  end
end
