require 'spec_helper'

describe ExpenseSaver do
  let(:user) { create :user }

  describe "#sync" do
  
    context "no groups" do
      it "creates an expense" do
        es = ExpenseSaver.new( {user_id: user.id,
                                expenses: [ { name: 'Hotdog', amount: 12.50, posted_at: Time.now} ]  
                              } )
        es.sync
        expect(es.sync).to change{Expense.count}.by(1)
      end
    end

    context "with groups" do


    end
  end

end
