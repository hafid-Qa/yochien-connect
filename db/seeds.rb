# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

USERS= [
  {
  email: "joyce@example.com",
  password: "Password123",
  },
  {
  email: "hafid@@example.com",
  password: "Password123",
  },
  {
  email: "fred@@example.com",
  password: "Password123",
  }
]
USERS.each do |user_acc|
  new_user = User.new(user_acc)
  new_user.save!
end
