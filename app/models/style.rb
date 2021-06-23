class Style < ApplicationRecord
  # searchkick word_start: [:name]

  acts_as_favoritable

  include PgSearch::Model

  pg_search_scope :search_by_name_and_description,
                  against: %i[name description],
                  using: { tsearch: { prefix: true } }
  has_many :items
  validates_presence_of :name
  belongs_to :user
  has_one_attached :photo
end
