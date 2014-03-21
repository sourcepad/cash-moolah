user = User.find_or_initialize_by_email("lilwayne@cashmoolah.com")
user.name = "Lil Wayne"
user.password = "source101010"
user.save