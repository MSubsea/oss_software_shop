class Release < ApplicationRecord
  belongs_to :software
  belongs_to :user
end
