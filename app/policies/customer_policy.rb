class CustomerPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user
        scope.all
      end
    end
  end

  def create?
    admin?
  end


  def update?
    admin?
  end

  def destroy?
    admin?
  end

  def show?
    user
  end

  private

  def admin?
    user&.admin?
  end
end
