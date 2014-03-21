module CashMoolah
  class ExpenseApi < Grape::API

    # {user_id: 'sdklfj',
    #   groups: [
    #     { name: 'group1', expenses: 
    #       [
    #         {name: 'af', amount: 123.23, posted_at: 'time'}
    #       ]
    #     }
    #   ],

    #   expenses: [
    #     {name: 'af', amount: 123.23, posted_at: 'time'}
    #   ]
    # }
    resource :expenses do

      post :sync do
        # guard!
        
      end

    end


  end

end