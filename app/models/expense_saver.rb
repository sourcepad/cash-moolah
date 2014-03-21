class ExpenseSaver

  attr_reader :params

  def initialize params
    @params = params
  end

  def sync
    params[:expenses].each do |expense_params|
      expense = Expense.new(expense_params)
      ExpenseStatsUpdater.new(expense).update if expense.save
    end
  end


end