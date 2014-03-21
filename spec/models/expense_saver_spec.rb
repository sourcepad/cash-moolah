require 'spec_helper'

describe ExpenseSaver do

  context "no groups" do

    describe "#sync" do

      it "creates an expense" do
        es = ExpenseSaver.new( {user_id: '3hjg',
                                expenses: [ { name: 'Hotdog', amount: 12.50, posted_at: Time.now} ]  
                              } )
        es.sync
        expect(es.sync).to change{Expense.count}.by(1)
      end

    end

  end

end
