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

puts 'seeding users...'

# My styles
user = User.create!(username: 'antshaw', email: 'shawanthonyj@gmail.com', password: '123456', first_name: 'Anthony', last_name: 'Shaw')

style_name = "Summer Look"
description = "Trying out a new summer look. What do you think?"
url = 'https://images.unsplash.com/photo-1590504425127-1e415bb06444?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2665&q=80'
file = URI.open(url)
style = Style.create!(name: style_name, description: description, user: user).photo.attach(io: file, filename: 'summer.jpg', content_type: 'image/jpg')

ITEM_CATEGORIES = %w[socks tops trousers accessories footwear]


# item_top = Item.create!(style: style, name: 'jacket').photo.attach(io: URI.open("https://source.unsplash.com/1600x900/?#{item_top.name}"), filename: 'jacket.jpg', content_type: 'image/jpg')
# item_bottom = Item.create!(style: style, name: 'shorts')
# item_footwear = Item.create!(style: style, name: 'trainers')
# item_accessories = Item.create!(style: style, name: 'hat')


puts 'seeding styles'



10.times do
  username = Faker::Internet.username
  email = Faker::Internet.email
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create!(username: username,
                      email: email,
                      password: '123456',
                      first_name: first_name,
                      last_name: last_name)
end

User.all.each do |user|
  5.times do
    adjective = %w[Cool Stylish Pretty Amazing Sleek Summer Winter Autumn Spring Freaky].sample
    noun = %w[collection style mode feeling mood vibe idea ideas move thoughts plans ]
    style_name = "#{adjective} #{noun}"
    description = Faker::Hipster.paragraph
    url = "https://source.unsplash.com/1600x900/?#{style_name}"
    file = URI.open(url)
    style = Style.create!(name: style_name, description: description, user: user).photo.attach(io: file, filename: "#{style_name}.jpg", content_type: 'image/jpg')
  end
end

puts 'seeded!'

puts 'seeding items...'

Style.all.each do |style|

  Item::ITEM_CATEGORIES.each do |category|

    adjective = %w[cool stylish pretty amazing sleek].sample
    clothes_type = category
    size = Item::SIZE_CATEGORIES.sample
    name = "#{adjective} #{clothes_name(clothes_type)}"
    price: Faker::Number.decimal(l_digits: 2)
    color: Faker::Color.color_name
    description: Faker::Hipster.paragraph
    url = "https://source.unsplash.com/1600x900/?#{name}"
    file = URI.open(url)
    Item.create!(size: size,
                 clothes_type: clothes_type,
                 price: price,
                 description: description,
                 color: color,
                 style: style,
                 name: name).photo.attach(io: file, filename: "item_#{name}.jpg", content_type: 'image/jpg')
  end
end

puts 'seeded!'

puts "You have #{User.count} users, #{Style.count} styles and #{Item.count} items. Not bad!"

  ITEM_CATEGORIES = %w[socks tops trousers accessories footwear]


def clothes_name(category)
  case category
  when 'socks'
    "#{%w[knee\ high ankle\ length invisible\ funky novelty running].sample} socks"
  when 'tops'
    %[t-shirt dress shirt jumper sweatshirt].sample
  when 'trousers'
    %w[shorts trousers pants pantaloons joggers tracksuit\ bottoms].sample
  when 'accessories'
    %w[dad\ hat sunglasses tie cap trilby sun\ hat].sample
  when 'footwear'
    %w[stilettos sneakers trainers sandals wedges loafers brothel\ creepers pumps monkstraps moccasins].sample
  else
    return ""
  end
end







