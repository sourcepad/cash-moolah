class LandingController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:home]
   
  def home
  end

  def dashboard
  end
end