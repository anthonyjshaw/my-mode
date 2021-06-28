class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :style
  has_many :replies
end
