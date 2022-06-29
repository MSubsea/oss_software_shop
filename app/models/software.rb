class Software < ApplicationRecord
  has_many :releases, dependent: :destroy
  has_many :reviews, through: :releases

  validates :title, uniqueness: true, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 20 }
end
