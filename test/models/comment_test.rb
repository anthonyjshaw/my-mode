require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'comment should belong to a style' do
    comment = Comment.create(content: 'great')
    assert_not comment.valid?
  end

  test 'comment content should not be empty' do
    comment = Comment.create(content: '')
    assert_not comment.valid?
  end

end
