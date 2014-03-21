class LandingController < ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :redirect_if_auth
   
  def home
  end

  private
    def redirect_if_auth
      if current_user
        redirect_to dashboard_path 
      end
    end
end