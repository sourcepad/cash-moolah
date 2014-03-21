class LandingController < ApplicationController
  skip_before_filter :authenticate_user!
   
  def home
  end

  def dashboard
  end
end