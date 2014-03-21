class ExpensesByDate
  attr_reader :params, :expenses_klass

  def initialize params, expenses_klass = Expense
    @params = params
    @expenses_klass = expenses_klass
  end

  def date
    @date = Time.parse(params[:date])
  end

  def query_params
    { user_id: params[:user_id], date: date }
  end

  def fetch
    WithinTheDayQuery.new(query_params).find_each
  end

end