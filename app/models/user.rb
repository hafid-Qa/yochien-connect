class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :children_as_parent, class_name: "Child", foreign_key: :parent_id, dependent: :destroy
  has_many :children_as_teacher, class_name: "Child", foreign_key: :teacher_id
  has_many :trips
  validates :email, presence: true
  validates :full_name, presence: true
  # validates :type, presence: true
end
