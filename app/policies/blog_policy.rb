class BlogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    true
  end

  def show?
    true
  end

  def create?
    user.employee
  end

  def update?
    user.admin || record.user == user
  end

  def destroy?
    user.admin || record.user == user
  end
end
