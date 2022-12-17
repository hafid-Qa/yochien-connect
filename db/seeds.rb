# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "clearing the database"
User.destroy_all
puts "creating admin Users..."
USERS= [
  {
  email: "joyce@example.com",
  password: "Password123",
  admin: true,
  },
  {
  email: "hafid@example.com",
  password: "Password123",
  admin: true,
  },
  {
  email: "fred@example.com",
  password: "Password123",
  admin: true,
  }
]
USERS.each do |user_acc|
  new_user = User.new(user_acc)
  new_user.save!
end
puts "Admin Users created successfully"

puts "creating Parents teachers and driver "

10.times do |person|
user= User.create!{
 email: "", created_at: nil, updated_at: nil, admin: false, full_name: nil

}

end