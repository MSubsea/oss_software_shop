class Customer < ApplicationRecord
  has_many :customers, dependent: :destroy
end
