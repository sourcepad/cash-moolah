CashMoolah::Application.routes.draw do  

  devise_for :users
      
  use_doorkeeper
  
  root to: "landing#home"
  match 'dashboard', to: 'landing#dashboard', via: :all

  mount API => '/'
end
