class Quantity < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :unit

  def unit_name
    unit.name.pluralize(amount)
  end

  def ingredient_name
    ingredient.name
  end
end
