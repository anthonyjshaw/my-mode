class Item < ApplicationRecord
  has_many_attached :photos
  ITEM_CATEGORIES = %w[socks t-shirt shirt trousers underwear accessories]
  SIZE_CATEGORIES = %w[S M L XL XXL]

  enum gender: %i[women men neutral]
  validates_presence_of :clothes_type,
                        :color,
                        :description,
                        :size,
                        :price,
                        :quantity,
                        :name,
                        :is_in_stock,
                        :gender
  validates :price, numericality: { greater_than: 0 }
  validates :clothes_type, inclusion: { in: ITEM_CATEGORIES }
  validates :size, inclusion: { in: SIZE_CATEGORIES }
end
