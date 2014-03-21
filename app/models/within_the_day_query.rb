class WithinTheDayQuery
  def initialize params, relation = Expense.all
    @user_id = params[:user_id]
    @date = params[:date]
    @relation = relation
  end

  def beginning_of_day
    @date.beginning_of_day
  end

  def end_of_day
    @date.end_of_day
  end

  def find_each
    @relation.where(user_id: @user_id)
             .where("posted_at <= ?", end_of_day)
             .where("posted_at >= ?", beginning_of_day)
  end
end