class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }
end
