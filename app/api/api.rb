class API < Grape::API  
  prefix 'api'

  default_format :json
  default_error_formatter :json

  version 'v1', :using => :path, :vendor => 'cash_moolah'
  mount CashMoolah::Ping
  mount CashMoolah::ExpenseApi
  mount CashMoolah::RegistrationApi
  mount CashMoolah::Auth
end