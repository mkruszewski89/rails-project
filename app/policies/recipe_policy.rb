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

  def permitted_attributes
    if user.admin? || record.try(:user) == user
      [:user, :name, quantities_attributes: [:amount, :ingredient, :unit], instructions_attributes: [:content]]
    else
      []
    end
  end

end
