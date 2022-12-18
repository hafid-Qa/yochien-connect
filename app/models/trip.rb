class Trip < ApplicationRecord
  has_many :child_in_trips
  has_many :children, through: :child_in_trips
  belongs_to :driver, class_name: "User", optional: true
end
