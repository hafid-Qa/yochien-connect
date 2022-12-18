class Route < ApplicationRecord
  has_many :trips, dependent: :destroy
end
