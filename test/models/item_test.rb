require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  test 'item should belong to style' do
    item = Item.new(name: 'Hi', clothes_type: Item::ITEM_CATEGORIES.sample, size: Item::SIZE_CATEGORIES.sample, price: 12.43, color: 'red')
    assert_not item.save, 'Item does not belong to a style'
  end

  test 'name, category, price, size should exist' do

  end

end
