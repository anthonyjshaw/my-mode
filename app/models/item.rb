class Item < ApplicationRecord
  belongs_to :style
  has_one_attached :photo
  ITEM_CATEGORIES = %w[socks tops trousers accessories footwear]
  SIZE_CATEGORIES = %w[S M L XL XXL]

  validates_presence_of :clothes_type,
                        :color,
                        :description,
                        :size,
                        :price,
                        :name
  validates :price, numericality: { greater_than: 0 }
  validates :clothes_type, inclusion: { in: ITEM_CATEGORIES }
  validates :size, inclusion: { in: SIZE_CATEGORIES }
end
