# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'destroying items...'

Item.destroy_all

puts 'How many seeds?'

# num = gets.chomp.to_i

puts 'seeding'

30.times do

color = Faker::Color.color_name
clothes_type = Item::ITEM_CATEGORIES.sample
description = Faker::Hipster.sentences(number: 1)
size = Item::SIZE_CATEGORIES.sample
price = Faker::Number.decimal(l_digits: 3, r_digits: 2)
quantity = Faker::Number.number(digits: 3)
name = Faker::Hipster.sentence(word_count: 3)
is_in_stock = true,
gender = %w[women men neutral].sample

Item.create(name: name,
            color: color,
            clothes_type: clothes_type,
            description: description,
            size: size,
            price: price,
            quantity: quantity,
            is_in_stock: is_in_stock,
            gender: gender)
end

puts 'seeded!'
