# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

file = URI.open("https://da.lowes.ca/webassets/images/1061196_09522085_001_l.jpg")
file2 = URI.open("https://da.lowes.ca/webassets/images/1033802_09522258_001_l.jpg")
file3 = URI.open("https://da.lowes.ca/webassets/images/330060138_MainImage_001_l.jpg")
file4 = URI.open("https://da.lowes.ca/webassets/images/997803_09232304_001_l.jpg")
file5 = URI.open("https://da.lowes.ca/webassets/images/330853938_MainImage_001_l.jpg")

puts "Destroying all bookings..."
Booking.destroy_all

puts "Destroying all tools..."
Tool.destroy_all

puts "Destroying all users..."
User.destroy_all

# User -------------------------------

puts "Generating users..."
user1 = User.create(
  email: "jacktorrance@gmail.com",
  password: '123456'
)

user2 = User.create(
  email: "caillouanderson@gmail.com",
  password: "123456"
)

pp user1.id, user2.id
puts "Done generating users!"

# Tool -------------------------------
puts "Generating tools..."

# https://www.lowes.ca/product/power-sanders/craftsman-120-volt-2-amps-corded-sheet-sander-1061196
tool1 = Tool.create(
  name: "CRAFTSMAN 120-Volt 2-Amps Corded Sheet Sander",
  tool_type: "Power Tools",
  price: 40.50,
  description: "Complete tasks with ease with this Craftsman finishing sander. With a 2 amp motor, it gives you up to 13,000 orbits per minute (OPM). This electric finishing sander has a dust-sealed switch to improve its durability. The onboard dust collection system improves user comfort. This versatile high speed sander performs well in surface preparation, paint stripping and varnish removal applications.",
  location: "460 Villeneuve, Montreal",
  user: user1
)
tool1.photo.attach(io: file, filename: "placeholder.png", content_type: "image/png")
tool1.save

# https://www.lowes.ca/product/air-inflators/craftsman-12-volt-and-120-volt-120-volt-lithium-ion-li-ion-air-inflator-power-source-battery-car-electric-1033802
tool2 = Tool.create(
  name: "CRAFTSMAN 12-Volt and 120-Volt / 120-Volt Lithium ion (Li-ion) Air Inflator (Power Source: Battery; Car; Electric)",
  tool_type: "Air Tools",
  price: 55.00,
  description: "Inflate inner tubes, tires and air mattresses with ease using the Craftsman electric inflator. Set the desired PSI on the digital gauge and the unit shuts off automatically when this level of pressure is reached. It plugs into an AC outlet, a 12-volt car adapter or runs on a 20-volt battery (not included) for use at home or on the road. A handle makes the Craftsman cordless inflator conveniently portable.",
  location: "4890 Esplanade Ave, Montreal",
  user: user1
)
tool2.photo.attach(io: file2, filename: "placeholder2.png", content_type: "image/png")
tool2.save

# https://www.lowes.ca/product/multi-tools/hvtools-snap-ring-plier-set-330060138
tool3 = Tool.create(
  name: "HVTools Snap Ring Plier Set",
  tool_type: "Hand Tools",
  price: 20.00,
  description: "Spring ring clamp set with external and internal 3-piece tips. The heat treated chromium-molybdenum steel clamp offers increased durability and extended service life. The insulating vinyl handles are comfortable and guarantee a solid grip.",
  location: "3570 Durocher, Montreal",
  user: user2
)
tool3.photo.attach(io: file3, filename: "placeholder3.png", content_type: "image/png")
tool3.save

# https://www.lowes.ca/product/mechanics-tool-sets/craftsman-gun-metal-81-piece-standard-sae-mechanics-tool-set-with-hard-997803
tool4 = Tool.create(
  name: "CRAFTSMAN GUN METAL 81-Piece Standard (SAE) Mechanic's Tool Set with Hard",
  tool_type: "Hand Tools",
  price: 70.00,
  description: "This Craftsman mechanics tool set offers a variety of tools and accessories that will help you accomplish all your projects. With 2 ratchet wrenches (3/8 inch and 1/2 inch), 2 extensions, as well as a wide range of sockets, bits, hexagonal keys and adapters, you will get your money's worth! Includes a blow moulded plastic case. Backed by a lifetime warranty.",
  location: "159 Villeneuve Ouest, Montreal",
  user: user1
)
tool4.photo.attach(io: file4, filename: "placeholder4.png", content_type: "image/png")
tool4.save

# https://www.lowes.ca/product/welders-cutters/lincoln-electric-ac225-stick-welder-240v-225a-330853938
tool5 = Tool.create(
  name: "Lincoln Electric AC225 Stick Welder 240V 225A",
  tool_type: "Welding & Soldering",
  price: 100.00,
  description: "Easy to operate - Full range 40-225 amp selector switch quickly sets the welding current and ensures a uniform arc each and every time you weld",
  location: "1030 Jeanne-Mance, Montreal",
  user: user2
)
tool5.photo.attach(io: file5, filename: "placeholder5.png", content_type: "image/png")
tool5.save

# dollars = (12..500).to_a.sample
# cents = (10..99).to_a.sample
# users = [user1, user2].sample

# tool6 = Tool.create(
#   name: Faker::ElectricalComponents.electromechanical,
#   tool_type: Faker::Construction.heavy_equipment,
#   price: "#{dollars}.#{cents}",
#   description: Faker::Construction.heavy_equipment,
#   user: users
# )

tool6 = Tool.create(
  name: "Apple",
  tool_type: "Welding & Soldering",
  price: 100.00,
  description: "Rant and ensures a uniform arc each and every time you weld",
  location: "303 Jeanne-Mance, Montreal",
  user: user2
)
tool6.save

pp tool6
puts "Done generating tools!"
# pp tool1, tool2, tool3, tool4, tool5
# name, tool_type, price, description, location

# Booking -------------------------------
puts "Generating bookings..."

booking1 = Booking.create(
  user: user2,
  tool: tool3,
  status: 0,
  starting_date: Date.new(2022, 11, 18),
  end_date: Date.new(2022, 11, 22)
)

booking2 = Booking.create(
  user: user1,
  tool: tool5,
  status: 0,
  starting_date: Date.new(2022, 12, 5),
  end_date: Date.new(2022, 12, 12)
)

booking3 = Booking.create(
  user: user1,
  tool: tool4,
  status: 0,
  starting_date: Date.new(2022, 11, 17),
  end_date: Date.new(2022, 11, 21)
)

booking4 = Booking.create(
  user: user2,
  tool: tool2,
  status: 0,
  starting_date: Date.new(2022, 12, 7),
  end_date: Date.new(2022, 12, 14)
)

puts "Done generating bookings"
# pp booking1, booking2, booking3, booking4
