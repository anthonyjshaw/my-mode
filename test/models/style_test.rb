require 'test_helper'

class StyleTest < ActiveSupport::TestCase

  test 'name should be present' do
    style = Style.new(name: '')
    assert_not style.save, 'Name is not present'
  end

  test 'style should have user' do
    style = Style.new(name: 'Summer look', description: 'Looking to test a new summer look.')
    assert_not style.valid?, 'User is not present'
  end

  test 'search should return word based on partial match' do
    search = Style.search_by_name_and_description('sum')
    search.each {|result| puts result.name}
    assert search
  end

  test 'style should only have one item per category' do
    user = User.create!(email: 'ant@dave.com', username: 'antshaw', first_name: "Anthony", last_name: "Shaw", password: '123456')
    style = Style.create!(name: 'Summer look', description: 'Looking to test a new summer look.', user: user)
    item = Item.create!(name: 'hat', description: 'a hat', color: 'red', size: 'L', clothes_type: 'accessories', style: style, price: 12.99)
    item2 = item.dup
    assert_not item2.valid?, "Cannot have more than one of item in same category"
  end

end
