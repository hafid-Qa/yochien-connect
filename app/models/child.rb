class Child < ApplicationRecord
  attribute :age, type: :date

  belongs_to :parent, class_name: "User"
  has_many :child_in_trips
  has_many :trips, through: :child_in_trips
  validates :full_name, presence: true
  validates :full_address, presence: true
  validates :full_name, presence: true
  

  def age
    DateTime.current.to_date.year - birthday.year
  end
end
