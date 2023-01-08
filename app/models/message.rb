class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  before_create :confirm_participants

  def confirm_participant
    return unless chatroom.is_private

    is_participant = Participant.where(user_id: user.id, chatroom_id: chatroom.id).first
    throw :abort unless is_participant
  end
end
