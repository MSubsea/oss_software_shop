class Software < ApplicationRecord
  belongs_to :customer
  has_many :releases, dependent: :destroy
  has_many :reviews, through: :releases
  has_one_attached :photo

  validates :title, uniqueness: true, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 20 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
