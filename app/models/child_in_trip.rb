class ChildInTrip < ApplicationRecord
  belongs_to :trip
  belongs_to :child, optional: true
end
