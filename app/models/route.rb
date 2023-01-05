class Route < ApplicationRecord
  has_many :trips
  has_many :children, through: :trips
  belongs_to :driver, class_name: "User", optional: true
end
