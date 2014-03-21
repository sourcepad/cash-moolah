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
      p = ActionController::Parameters.new(expense_params).permit(:name, :amount, :posted_at)
      expense = Expense.create(p)
    end
  end
end