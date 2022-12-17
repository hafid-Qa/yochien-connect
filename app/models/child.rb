class Child < ApplicationRecord
  attribute :age, type: :date

  belongs_to :parent, class_name: "User"
  belongs_to :teacher, class_name: "User"
  validates :full_name, presence: true
  validates :full_address, presence: true
  validates :full_name, presence: true
  validates :status, presence: true
  enum :status, ["on board",
                 "dropped off",
                 "not boarded",
                 "transport cancelled",
                 "at school",
                 "left school",
                 "absent",
                 "waiting for pick up"],
       default: "waiting for pick up"

  def age
    DateTime.current.to_date.year - birthday.year
  end
end
