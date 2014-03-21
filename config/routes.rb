CashMoolah::Application.routes.draw do
  devise_for :users
  
  devise_for :users do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
  end

  root to: "landing#home"
end
