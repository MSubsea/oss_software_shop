class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user && user.role && user.role > 1
        scope.all
      end
    end
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

  private

  def admin?
    user && user.role && user.role > 1
  end
end
