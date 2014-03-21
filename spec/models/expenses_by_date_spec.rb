require 'spec_helper'

describe ExpensesByDate do

  let(:user) { create(:user) }
  let!(:expense) {  create( :expense, name: 'Hotdog', amount: 46.50, posted_at: Time.parse('2014-03-21'), user: user ) }

  describe "#fetch" do

    it "does things" do
      params = { user_id: user.id, date: '2014-03-21' }
      expense_by_date = ExpensesByDate.new(params)

      expect(expense_by_date.fetch).to include(expense)
    end

  end

end