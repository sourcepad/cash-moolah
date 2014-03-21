module CashMoolah
  class Ping < Grape::API
    desc 'Returns pong.'
    get :ping do
      guard!
      { ping: params[:pong] || 'pong' }
    end
  end
end