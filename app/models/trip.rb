class Trip < ApplicationRecord
  belongs_to :child
  belongs_to :user
  validates :pick_up_time, presence: true
  validates :drop_off_time, presence: true
end
