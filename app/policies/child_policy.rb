class ChildPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(parent_id: user.id)
      end
    end
  end

  def all?
    true
  end
end
