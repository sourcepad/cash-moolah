CashMoolah::Application.routes.draw do  
  devise_for :users
      
  root to: "landing#home"
end
