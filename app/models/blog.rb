class Blog < ApplicationRecord
  validates_presence_of :title, :content
  has_rich_text :content
  has_one_attached :photo
  belongs_to :user


  validate :photo_size_validation, :if => :photo  

  def photo_size_validation
    if photo.attached?
      errors[:photo] << "should be less than 1MB" if photo.byte_size > 1_000_000
    end
  end
end
