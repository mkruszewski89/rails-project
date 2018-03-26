class RecipePolicy < ApplicationPolicy

  def edit?
    user.try(:email) && (user.admin? || record.try(:user) == user)
  end

  def update?
    user.try(:email) && (user.admin? || record.try(:user) == user)
  end

  def destroy?
    user.try(:email) && (user.admin? || record.try(:user) == user)
  end

end
