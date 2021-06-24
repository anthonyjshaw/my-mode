require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "visiting the index not logged in" do
    visit root_url

    assert_selector "h1", text: "my mode"
    assert_selector 'a', text: 'Find your style'
  end

  test 'visting the index page logged in takes you to the dashboard' do
    login_as users(:james)
    visit '/'

    assert_selector 'h1', text: 'Home'
    assert_selector 'p', text: 'Welcome James'

    h2_headers = %w[Feed My\ Styles Liked\ Styles]
    h2_headers.each do |header|
      assert_selector 'h2', text: "#{header}"
    end
  end
end
