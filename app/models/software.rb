class Software < ApplicationRecord
  belongs_to :customer
  has_many :releases, dependent: :destroy
  has_many :reviews, through: :releases
  has_one_attached :photo

  validates :title, uniqueness: true, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :latitude, numericality: { only_integer: false, greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, numericality: { only_integer: false, greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
                  against: [ :title, :description ],
                  associated_against: {
                    customer: [:name]
                  },
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
