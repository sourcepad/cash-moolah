module CashMoolah
  class Ping < Grape::API
    format :json
    desc 'Returns pong.'
    get :ping do
      guard!
      { ping: params[:pong] || 'pong' }
    end
  end
end