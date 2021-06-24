require 'test_helper'

class StyleTest < ActiveSupport::TestCase

  test 'name should be present' do
    style = Style.new(name: '')
    assert_not style.save, 'Name is not present'
  end

  test 'style should have user' do
    style = Style.new(name: 'Summer look', description: 'Looking to test a new summer look.')
    assert_not style.save, 'User is not present'
  end

  # test 'should be able to save styles' do
  #   user1 = User.create(email: 'ant@ant.com', username: 'username', password: '123456')
  #   user2 = User.create(email: 'dave@ant.com', username: 'dave', password: '123456')
  #   style = Style.create(user: user1, name: "Summer look", description: 'Looking to test a new summer look')
  #   user2.favorite(style).valid?
  # end

end
