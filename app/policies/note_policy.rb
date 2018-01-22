class NotePolicy < ApplicationPolicy

  def show?
    user.admin? || record.user_id == user.id
  end

  def new?
    !!current_user
  end

  def create?
    current_user && !record.persisted?
  end

  def edit?
    user.admin? || record.user_id == user.id
  end

  def update?
    user.admin? || record.user_id == user.id
  end

  def destroy?
    user.admin? || record.user_id == user.id
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(:user_id => user.id)
      end
    end

  end

end
