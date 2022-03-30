require "application_system_test_case"


puts "Comment test"


class CommentsTest < ApplicationSystemTestCase
  test 'visiting style show page should have comments' do

    style = Style.create!(name: 'nice style', description: 'The best style', user: User.first)
    comment = Comment.create!(content: 'What a great style', user: User.all[1], style: style)
    puts style.valid?
    puts comment.valid?
    visit style_url(style.id)
    assert_selector 'p.content', text: comment.content
    assert_selector 'p', text: comment.user.username
    assert_selector 'p', text: comment.created_at.strftime("%d/%m/%Y")
  end

  test 'lets a signed in user create a comment' do

  end

end
