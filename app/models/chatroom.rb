class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  scope :public_chatrooms, -> { where(is_private: false) }
end
