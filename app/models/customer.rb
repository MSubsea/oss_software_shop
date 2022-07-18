class Customer < ApplicationRecord
  has_many :softwares, dependent: :destroy
  has_one_attached :photo
end
