class ChildInTrip < ApplicationRecord
  belongs_to :trip
  belongs_to :child, optional: true
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
end
