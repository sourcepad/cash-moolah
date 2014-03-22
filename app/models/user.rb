class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :expenses, dependent: :destroy       
  has_many :expense_stats, dependent: :destroy
  has_one :api_key, -> { where(active: true) }

  def generate_api_key
    key = ApiKey.where(user_id: self.id, active: true).first
    key.update_attributes(active: false) if key.present? and key.expired?
    ApiKeyCreator.new(self).save if key.nil? or key.expired?
  end

  def access_token
    generate_api_key
    self.api_key.access_token
  end
end
