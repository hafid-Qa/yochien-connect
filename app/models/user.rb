class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :children_as_parent, class_name: "Child", foreign_key: :parent_id, dependent: :destroy
  has_many :trips_as_driver, class_name: "Trip", foreign_key: :driver_id
  validates :email, presence: true
  validates :full_name, presence: true
  has_many :messages, dependent: :destroy
  scope :all_parents, -> { where.not(admin: true).where.not(role_type: "driver") }
  scope :all_admins, -> { where(admin: true) }

  def self.create_private_chatroom(users, room_name)
    single_room = Room.create(name: room_name, is_private: true)
    users.each do |user|
      Participant.create(user_id: user.id, room_id: single_room.id)
    end
    single_room
  end
end
