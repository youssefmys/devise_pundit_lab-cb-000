class UserPolicy < ApplicationPolicy

  def index?
    user.admin?
  end

  def create?
    user.admin?
  end

  def show?
    user.admin? || user.id == record.id
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin? 
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.moderator?
        scope.all
      else
        scope.where(:id => user.id)
      end
    end
  end

end
