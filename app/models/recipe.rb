class Recipe < ApplicationRecord
  belongs_to :user
  has_many :instructions
  has_many :quantities
  has_many :ingredients, through: :quantities
  accepts_nested_attributes_for :quantities, :instructions
  validates :name, presence: true

  def quantities_attributes=(quantity_attributes)
    quantities.destroy_all
    quantity_attributes.values.each {|quantity_attribute|
      amount = quantity_attribute[:amount].to_f
      unit = Unit.find_by(name: quantity_attribute[:unit])
      ingredient = Ingredient.find_or_create_by(name: quantity_attribute[:ingredient])
      quantities << Quantity.create(amount: amount, unit: unit, ingredient: ingredient)
    }
  end

  def instructions_attributes=(instruction_attributes)
    instructions.destroy_all
    instruction_attributes.values.each {|instruction_attribute|
      instructions << Instruction.create(content: instruction_attribute[:content])
    }
  end

  def convert_ingredient_to_unit(ingredient_name, unit_name)
    data_to_convert = ingredient_quantity(ingredient_name)
    new_unit = Unit.find_by(name: unit_name)
    new_amount = data_to_convert[:amount] * data_to_convert[:unit].lowest_unit_equivalence / new_unit.lowest_unit_equivalence
    {unit: new_unit, amount: new_amount}
  end

  def ingredient_quantity(ingredient_name)
    ingredient_object = ingredients.detect {|ingredient| ingredient.name = ingredient_name}
    quantity_object = quantities.detect {|quantity| quantity.ingredient = ingredient_object}
    {unit: quantity_object.unit, amount: quantity_object.amount}
  end

end
