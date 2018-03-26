class RecipePolicy < ApplicationPolicy

  def edit?
    user.try && (user.admin? || record[:user] == user)
  end

  def update?
    user.try && (user.admin? || record[:user] == user)
  end

  def destroy?
    user.try && (user.admin? || record[:user] == user)
  end

end
