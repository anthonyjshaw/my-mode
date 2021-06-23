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
    save_and_open_screenshot

    assert_selector 'h1', text: 'Home'
    assert_selector 'p', text: 'Welcome James'
  end
end
