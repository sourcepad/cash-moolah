class ApiKey < ActiveRecord::Base
  belongs_to :user

  def expired?
    DateTime.now >= self.expires_at
  end
end
