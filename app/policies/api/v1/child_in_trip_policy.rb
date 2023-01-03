class Api::V1::ChildInTripPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def update?
    record.child.parent_id == user.id || user.admin
  end
end
