class ApiKeyCreator
  attr_reader :user, :api_klass

  def initialize user, api_klass = ApiKey
    @user = user
    @api_klass = api_klass
  end

  def save
    api_klass.create( user_id: user.id, expires_at: expires_at, access_token: access_token )
  end

  private

  def access_token
    begin
      token = SecureRandom.urlsafe_base64(nil, false)
    end while api_klass.exists?(access_token: token)
    @access_token ||= token
  end

  def expires_at
    DateTime.now + 15
  end
end