module CashMoolah
  class Auth < Grape::API

    resource :auth do

      desc "Creates and returns access_token if valid login"
      params do
        requires :email, type: String, desc: "Username or email address"
        requires :password, type: String, desc: "Password"
      end

      post :login do
        user = User.find_by(email: params[:email])

        if user && user.valid_password?(params[:password])
          key = ApiKeyCreator.new(user: user).create
          { access_token: key.access_token }
        else
          error!('Unauthorized.', 401)
        end
      end

    end

  end
end