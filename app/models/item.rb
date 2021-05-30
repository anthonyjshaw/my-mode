class Item < ApplicationRecord
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
end
