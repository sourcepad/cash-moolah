class ExpenseSaver
  attr_reader :params

  def initialize params
    @params = params
  end

  def user
    @user ||= User.find(params[:user_id])
  end

  def sync
    params[:expenses].each do |expense_params|
      # p = ActionController::Parameters.new(expense_params).permit(:name, :amount, :posted_at, :tags)
      expense = Expense.create(expense_params)
    end
  end
end