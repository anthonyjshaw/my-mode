class Blog < ApplicationRecord
  validates_presence_of :title, :content
  belongs_to :user
end
