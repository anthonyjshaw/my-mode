# This is the seed file for my mode.


puts 'destroying items...'

Item.delete_all
puts "Items destroyed!"

puts 'destroying styles...'
Style.delete_all
puts 'Styles destroyed!'

puts 'destroying users...'
User.all.each do |user|
  unless user.admin
    User.delete(user)
  end
end
puts 'Users destroyed'

puts 'Seeding...'

puts 'seeding users...'

# My styles


style_name = "Summer Look"
description = "Trying out a new summer look. What do you think?"
url = 'https://images.unsplash.com/photo-1590504425127-1e415bb06444?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2665&q=80'
file = URI.open(url)
style = Style.create!(name: style_name, description: description, user: User.first).photo.attach(io: file, filename: 'summer.jpg', content_type: 'image/jpg')




# Seed 30 users
30.times do |i|
  username = Faker::Internet.username
  email = Faker::Internet.email
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create!(username: username,
                      email: email,
                      password: ENV['PASSWORD'],
                      first_name: first_name,
                      last_name: last_name)
puts "user #{i + 1} created!"
end
puts 'seeded!'

puts 'seeding styles...'

# Seed styles. Each user has at least one style
User.all.each do |user|
  rand(1..3).times do |i|
    adjective = %w[Cool Stylish Pretty Amazing Sleek Summer Winter Autumn Spring Freaky Wonderful Masterful Awesome Nice Magical Superb Dour Depressing Dark Christmas].sample
    noun = %w[collection style mode feeling mood vibe idea ideas move thoughts plans wishlist group].sample
    style_name = "#{adjective} #{noun}"
    description_line1 = ['Been thinking about my', 'Want to present my', 'Need to show off my', 'Feeling passionate about my', 'Looking for feedback on my', "What do you think of my"].sample
    description_line2 = ["I love", "Not too keen on", "Had a lot of thoughts on", "I'm so inspired by", "Really drawn by", "Want to try out"].sample
    description_line3 = ["shapes", 'colours', 'design', 'pattern', 'fabric'].sample
    description_line4 = ["Tell me what you think!", "Tell me if I'm going crazy!", "I'm not wrong am I?", "Need a second opinion ha ha! 😅", "Be honest!", "Please be kind!", "Don't be too honest lol"].sample
    description = "#{description_line1} #{style_name.downcase}. #{description_line2} the #{description_line3}. #{description_line4}"
    url = "https://source.unsplash.com/1600x900/?#{style_name}"
    file = URI.open(url)
    style = Style.create!(name: style_name, description: description, user: user).photo.attach(io: file, filename: "#{style_name}.jpg", content_type: 'image/jpg')
    puts "Style count: #{Style.count}. #{user.username} style #{i + 1} created! It's a #{style_name}!"
  end
end

puts 'seeded!'



# Create items. Each Style has max of 5 items, sampled from the ITEMS_CATEGORIES array
puts 'seeding items...'

# Helper function to randomise the item name
def clothes_name(category)
  case category
  when 'socks'
    "#{%w[knee\ high ankle\ length invisible funky novelty running].sample} socks"
  when 'tops'
    %w[t-shirt dress shirt jumper sweatshirt blouse basketball\ jersey football\ shirt].sample
  when 'trousers'
    %w[shorts trousers jeans chinos joggers tracksuit\ bottoms flares skirt basketball\ shorts].sample
  when 'accessories'
    %w[dad\ hat sunglasses tie cap trilby sun\ hat].sample
  when 'footwear'
    %w[stilettos sneakers trainers sandals wedges loafers brothel\ creepers pumps monkstraps moccasins].sample
  else
    return ""
  end
end


Style.all.each do |style|

  Item::ITEM_CATEGORIES.each do |category|

    adjective = %w[cool stylish pretty amazing sleek].sample
    clothes_type = category
    size = Item::SIZE_CATEGORIES.sample
    type = clothes_name(clothes_type)
    name = "#{adjective} #{type}"
    price = Faker::Number.decimal(l_digits: 2)
    color = Faker::Color.color_name
    description = Faker::Hipster.paragraph
    url = ["public/images/stock_images/#{category}/#{type}.jpeg", "https://source.unsplash.com/1600x900?#{type}"].sample
    file = URI.open(url)
    Item.create!(size: size,
                 clothes_type: clothes_type,
                 price: price,
                 description: description,
                 color: color,
                 style: style,
                 name: name).photo.attach(io: file, filename: "item_#{type}.jpg", content_type: 'image/jpg')
    puts "#{style.name}'s #{category} is seeded!"
  end
  puts 'next style!'
  puts "-----------------------"
end

puts 'seeded!'

puts "You have #{User.count} users, #{Style.count} styles and #{Item.count} items. Not bad!"



# Comments







