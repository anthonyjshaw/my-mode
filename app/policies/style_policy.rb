class StylePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def my_styles?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def liked_styles?
    true
  end

  def update?
    set_auth
  end

  def destroy?
    set_auth
  end

  private

  def set_auth
    record.user == user
  end
end
