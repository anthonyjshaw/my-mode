class Item < ApplicationRecord
  ITEM_CATEGORIES = %w[socks t-shirt shirt trousers underwear accessories]
  SIZE_CATEGORIES = %w[S M L XL XXL]

  validates_presence_of :clothes_type,
                        :color,
                        :description,
                        :size,
                        :price,
                        :quantity,
                        :name,
                        :is_in_stock,
                        :gender
  validates_numericality_of :price, { greater_than: 0.0 }, :quantity
  validates_inclusion_of :clothes_type, { in: ITEM_CATEGORIES }, :size, { in: SIZE_CATEGORIES }
end
