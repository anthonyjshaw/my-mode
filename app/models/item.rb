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
end
