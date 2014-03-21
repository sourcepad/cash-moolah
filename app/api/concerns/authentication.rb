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
      acces_token = ApiKey.find_by(access_token: params[:acces_token])

      if acces_token && !acces_token.acces_token?
        @current_user = User.find(acces_token.user_id)
      else
        false
      end
    end

  end

end