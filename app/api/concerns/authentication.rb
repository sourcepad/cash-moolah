module Authentication
  extend ActiveSupport::Concern

  included do |base|
    helpers HelperMethods
  end


  module HelperMethods

    def authenticate!
      error!('Unauthorized. Invalid or expired token.', 401) unless current_user
    end

    def current_user
      api_key = ApiKey.find_by(access_token: params[:access_token])
      
      if api_key && !api_key.expired?
        @current_user = User.find(api_key.user_id)
      else
        false
      end
    end

  end

end