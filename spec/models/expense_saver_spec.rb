require 'spec_helper'

describe ExpenseSaver do
  let(:user) { create(:user) }

  describe "#sync" do

    context "no groups" do

      it "creates an expense" do
        es = ExpenseSaver.new(
            { user_id: user.id,
              expenses: [{ name: 'Hotdog', amount: 12.50, posted_at: Time.now}]}
          )

        expect{es.sync}.to change{Expense.count}.by(1)
      end

    end

    context "with tags" do

      it "creates a groups" do
        es = ExpenseSaver.new(
            { user_id: user.id,
              expenses: [
                { name: 'Tokwa',
                  amount: 13.50,
                  posted_at: Time.now,
                  tags: ['food', 'meryenda']
                }
              ]
            }
          )

        es.sync
        expense = Expense.first
        expect(expense.tags).to eq(['food', 'meryenda'])
      end

    end
  end

end
