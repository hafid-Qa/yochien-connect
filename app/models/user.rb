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
end
