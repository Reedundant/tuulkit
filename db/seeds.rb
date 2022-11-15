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

user1 = User.create(
  name: "Jack Torrance",
  email: "jacktorrance@gmail.com",
  password: '123456'
)

user2 = User.create(
  name: "Caillou Anderson",
  email: "caillouanderson@gmail.com",
  password: "123456"
)

pp user1, user2
puts "Done generating users!"

# Tool
puts "Destroying all tools..."
Tool.destroy_all
puts "Generating tools..."

# name, type, price, description, location
