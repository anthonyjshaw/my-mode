class StylePolicy < ApplicationPolicy
  before_action :set_auth, only: %i[update destroy]
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

  def update?; end

  def destroy?; end

  private

  def set_auth
    record.user == user
  end
end
