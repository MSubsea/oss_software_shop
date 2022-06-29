class Review < ApplicationRecord
  belongs_to :user
  belongs_to :release

  validates :comment, length: { minimum: 6 }
  validates :rating, presence: true
end
