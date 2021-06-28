require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  test 'reply should have a user' do
    reply = Reply.create(comment: Comment.first, content: "I agree!")
    assert_not reply.valid?
  end

  test 'reply should have content' do
    reply = Reply.create(comment: Comment.first, content: '', user: User.first)
    assert_not reply.valid?
  end
end
