class ExpenseStatsUpdater
  attr_reader :expense

  def initialize expense
    @expense = expense
  end

  def date
    @date = expense.posted_at
  end

  def query_params
    { user_id: user_id, date: date }
  end


  def user_id
    expense.user_id
  end

  def expense_stat
    @expense_stat ||= WithinTheDayQuery.new(query_params, ExpenseStat.all)
                                       .find_each
                                       .first_or_create
  end

  def update
    expense_stat.amount += expense.amount
    expense_stat.save
  end

end