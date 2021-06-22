# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'destroying items...'

Item.destroy_all
puts "Items destroyed!"

puts 'destroying styles...'
Style.destroy_all
puts 'Styles destroyed!'

puts 'destroying users...'
User.destroy_all
puts 'Users destroyed'

puts 'Seeding...'


  user = User.create!(username: 'antshaw', email: 'shawanthonyj@gmail.com', password: '123456', first_name: 'Anthony', last_name: 'Shaw')

  style_name = "Summer Look"
  description = "Trying out a new summer look. What do you think?"
  url = 'https://images.unsplash.com/photo-1590504425127-1e415bb06444?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2665&q=80'
  file = URI.open(url)
  Style.create!(name: style_name, description: description, user: user).photo.attach(io: file, filename: 'summer.jpg', content_type: 'image/jpg')


# color = Faker::Color.color_name
# clothes_type = Item::ITEM_CATEGORIES.sample
# description = Faker::Hipster.sentences(number: 1)
# size = Item::SIZE_CATEGORIES.sample
# price = Faker::Number.decimal(l_digits: 3, r_digits: 2)
# name = Faker::Hipster.sentence(word_count: 2)

# Item.create(name: name,
#             color: color,
#             clothes_type: clothes_type,
#             description: description,
#             size: size,
#             price: price,
#             quantity: quantity,
#             is_in_stock: is_in_stock,
#             style_id: style)


puts 'seeded!'
