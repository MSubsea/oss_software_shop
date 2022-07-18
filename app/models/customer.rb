class Customer < ApplicationRecord
  has_many :softwares, dependent: :destroy
end
