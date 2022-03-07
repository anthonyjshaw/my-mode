class Blog < ApplicationRecord
  validates_presence_of :title, :content
  has_one_attached :photo
  belongs_to :user
end
