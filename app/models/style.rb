class Style < ApplicationRecord
  has_many :items
  validates_presence_of :name
  belongs_to :user
  has_one_attached :photo
end
