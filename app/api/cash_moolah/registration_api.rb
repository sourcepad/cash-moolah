module CashMoolah
  class RegistrationApi < Grape::API

    # {
    #   name: 'dsf',
    #   email: 'email',
    #   password: 'password',
    #   password_confirmation: 'password'
    # }
    post :register do
      p = ActionController::Parameters.new(params[:user]).permit(:name, :email, :password, :password_confirmation)
      user = User.new(p)
      
      if user.save
        { success: true, user: user }
      else
        error!(user.errors.messages, 400)
      end
    end

  end
end