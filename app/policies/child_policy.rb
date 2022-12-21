class ChildPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
       user.admin? ? scope : scope.find(parent_id: user.id)
      
    end
  end
end
