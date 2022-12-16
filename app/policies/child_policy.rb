class ChildPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.where(parent_id: user.id)
      scope.all
    end
  end
end
