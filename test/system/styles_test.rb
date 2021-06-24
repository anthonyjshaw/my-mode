require "application_system_test_case"

class StylesTest < ApplicationSystemTestCase
  test 'visting the show page should show the name in a banner' do
    style = Style.find_by(name: "Summer Look")
    accessory = style.items.find_by(clothes_type: 'accessories')
    visit "styles/#{style.id}"
    assert_selector '.style-banner h1', text: style.name
  end


  test 'visting the show page and seeing items' do
    style = Style.find_by(name: "Summer Look")
    accessory = style.items.find_by(clothes_type: 'accessories')

    puts accessory
    visit "/styles/#{style.id}"
    save_and_open_screenshot
    assert_selector 'p', text: accessory.name
    assert_selector 'p', text: accessory.description
  end

end
