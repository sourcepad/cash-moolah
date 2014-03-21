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
        ExpenseSaver.new(params[:data]).sync
      end

      # {user_id: '123', date: ''}

      get :by_date do
        # guard!
        ExpensesByDate.new(params[:data]).fetch
      end

      get :stats_by_year do
        # guard!
        user = User.find(params[:user_id])
        expense_stats.select("posted_at, amount").map{|x| [(x.posted_at.to_i * 1000), x.amount.to_f]}
      end

    end


  end

end