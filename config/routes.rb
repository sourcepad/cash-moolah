CashMoolah::Application.routes.draw do  
  use_doorkeeper
  devise_for :users do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
  end

  root to: "landing#home"

  mount API => '/'
end
