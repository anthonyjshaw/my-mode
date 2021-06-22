class Item < ApplicationRecord
  belongs_to :style
  has_many_attached :photos
  ITEM_CATEGORIES = %w[socks t-shirt shirts trousers underwear accessories]
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
