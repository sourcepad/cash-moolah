class API < Grape::API
  include APIGuard
  
  prefix 'api'

  default_format :json
  default_error_formatter :json

  version 'v1', :using => :path, :vendor => 'cash_moolah'
  mount CashMoolah::Ping
end