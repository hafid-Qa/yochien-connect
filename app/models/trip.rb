class Trip < ApplicationRecord
  belongs_to :child
  belongs_to :user
end
