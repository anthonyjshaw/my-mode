class Style < ApplicationRecord
  # searchkick word_start: [:name]

  acts_as_favoritable
  paginates_per 15
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates_presence_of :name
  has_one_attached :photo

  include PgSearch::Model

  pg_search_scope :search_by_name_and_description,
                  against: %i[name description],
                  associated_against: {
                    user: %i[username first_name last_name]
                  },
                  using: { tsearch: { prefix: true } }

end
