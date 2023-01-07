class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.public_rooms
    end
  end

  def show?
    true
  end

  def update?
    true
  end

  def create?
    true
  end

  def new?
    true
  end
end
