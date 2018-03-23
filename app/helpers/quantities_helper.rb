module QuantitiesHelper

  def display_quantity_amount(quantity)
    quantity.amount
  end

  def display_quantity_unit_name(quantity)
    quantity.unit.name.pluralize(quantity.amount)
  end

  def display_quantity_ingredient_name(quantity)
    quantity.ingredient.name
  end


end
