class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  scope :public_chatrooms, -> { where(is_private: false) }

  def self.create_private_chatroom(users, chatroom_name)
    single_chatroom = Chatroom.create(name: chatroom_name, is_private: true)
    users.each do |user|
      Participant.create(user_id: user.id, chatroom_id: single_chatroom.id)
    end
    single_chatroom
  end
end
