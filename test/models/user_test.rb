require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'should have unique usernames and emails' do
    user1 = User.create(email: 'ant@ant.com', username: 'username', password: '123456')
    user2 = user1.dup
    assert_not user2.valid?, "user1's username and email is the same as user2's."
  end
end
