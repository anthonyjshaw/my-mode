require "application_system_test_case"




class StylesTest < ApplicationSystemTestCase
  test 'visting the show page should show the name in a banner' do
    style = Style.find_by(name: "Summer Look")
    accessory = style.items.find_by(clothes_type: 'accessories')
    visit "styles/#{style.id}"
    save_and_open_screenshot
    assert_selector '.style-banner h1', text: style.name
    puts "Styles test"

  end


  test 'visting the show page and seeing items' do
    style = Style.find_by(name: "Summer Look")
    accessory = style.items.find_by(clothes_type: 'accessories')
    puts accessory
    visit "/styles/#{style.id}"
    style.items.each do |item|
      assert_selector 'p', text: item.name
      assert_selector 'img'
      assert_selector 'p', text: item.description
      
    end
    puts "Styles test"

  end

  test 'lets a signed in user create a new style' do
    login_as users(:anthony)
    visit new_style_url
    fill_in 'style_name', with: "Cool style"
    fill_in 'style_description', with: 'What a cool style'
    click_on "Create Style"
    style = Style.last
    assert_equal style_path(style), page.current_path
    puts "Styles test"

  end

end
