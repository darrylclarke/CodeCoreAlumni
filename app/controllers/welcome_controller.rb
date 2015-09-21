class WelcomeController < ApplicationController
  def index
    @profiles = Profile.all
  end
end
