# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User

puts "Destroying all users..."

User.destroy_all
puts "Generating users..."

2.times do
  user = User.create(
    email: Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"
  )

  puts user.email
  pp user
end


# Tool
