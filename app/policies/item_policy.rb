class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.style.user == user
  end

  def index?
    true
  end

  def update?
    record.style.user == user
  end

  def destroy
    record.style.user == user
  end
end
