require "application_system_test_case"

class BlogsTest < ApplicationSystemTestCase
  test 'visiting the blog page should show all blogs, the author and the title' do
    first_blog = Blog.first
    visit blog_posts_url
    assert_selector 'h1', text: 'Blog'
    assert_selector 'p', text: "#{first_blog.user.full_name}"
    assert_selector 'p', text: first_blog.title
    puts true
  end

  test 'clicking on the blog title should take you to the individual blog post' do
    visit blog_posts_url
    first_blog = Blog.first
    click_on first_blog.title
    assert_equal blog_path(first_blog), page.current_path
    puts true

  end

  test 'visiting the show page should show you the title and content of the page'  do
    first_blog = Blog.first
    visit blog_url(first_blog)
    assert_selector 'h1', text: first_blog.title
    assert_selector 'section', text: first_blog.content
    puts true
  end

end
