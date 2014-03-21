user = User.find_or_initialize_by_email("lilwayne@cashmoolah.com")
user.name = "Lil Wayne"
user.password = "source101010"
user.save

puts "Expense Stat is only seeded ONCE!"

if user.present?
  # small sample of expense

  user.expenses.create(name: "Food", amount: "100", posted_at: Time.now)
  user.expenses.create(name: "Transportation", amount: "78", posted_at: Time.now + 1.day)
  user.expenses.create(name: "Beer", amount: "42", posted_at: Time.now + 2.days)

  # expense stat seed
  (1..12).each do |month|
    (1..28).each do |num|
      gen_amount = Random.rand(7) * num
      user.expense_stats.create(amount: gen_amount, posted_at: Date.parse("#{num}-#{month}-2014"))
    end
  end
end