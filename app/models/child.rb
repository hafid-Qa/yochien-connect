class Child < ApplicationRecord
  attribute :age, type: :date
  attribute :trip, type: :hash

  belongs_to :parent, class_name: "User"
  has_many :child_in_trips
  has_many :trips, through: :child_in_trips
  validates :full_name, presence: true
  validates :full_address, presence: true
  validates :full_name, presence: true

  def age
    DateTime.current.to_date.year - birthday.year
  end

  def trip
    if Time.new.localtime.hour >= 14
      child_in_trips.where(trip_date: DateTime.current.to_date)[0]
    else
      child_in_trips.where(trip_date: DateTime.current.to_date)[1]
    end
  end
end
