class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  validates_presence_of :content
end
