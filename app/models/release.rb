class Release < ApplicationRecord
  belongs_to :software
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :version_number, uniqueness: {scope: :software}, presence: true
  validates :software_url, presence: true
end
