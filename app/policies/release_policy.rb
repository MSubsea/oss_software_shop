class ReleasePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    dev_or_admin?
  end

  def update?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    (user&.developer? && record.user == user) || user&.admin?
  end

  def dev_or_admin?
    user&.admin? || user&.developer?
  end
end
