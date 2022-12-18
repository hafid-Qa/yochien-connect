class Trip < ApplicationRecord
  has_many :children
  belongs_to :driver, class_name: "User", optional: true
  validates :trip_date, presence: true
  belongs_to :route
end
