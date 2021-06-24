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

  test 'search should return word based on partial match' do
    search = Style.search_by_name_and_description('sum')
    search.each {|result| puts result.name}
    assert search
  end

end
