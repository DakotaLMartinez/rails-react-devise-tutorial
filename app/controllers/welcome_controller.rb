class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: [:app]
  def home
  end

  def app
  end
end
