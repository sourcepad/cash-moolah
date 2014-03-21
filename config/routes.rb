CashMoolah::Application.routes.draw do  

  devise_for :users
      
  use_doorkeeper
  
  root to: "landing#home"

  mount API => '/'
end
