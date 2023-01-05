class Child < ApplicationRecord
  attribute :age, type: :date
  attribute :trip, type: :hash

  belongs_to :parent, class_name: "User"
  has_many :trips
  has_many :routes, through: :trips
  validates :full_name, presence: true
  validates :full_address, presence: true
  validates :full_name, presence: true

  def age
    DateTime.current.to_date.year - birthday.year
  end

  def trip
    trip = trips.where(trip_date: DateTime.current.to_date)
    if Time.new.localtime.hour >= 14
      { id: trip[0].id,
        status: trip[0].status }
    else
      { id: trip[1].id,
        status: trip[1].status }
    end
  end
end
