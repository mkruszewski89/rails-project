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
      quantity = Quantity.create(amount: amount, unit: unit, ingredient: ingredient)
      quantities << quantity
    }
  end

  def instructions_attributes=(instruction_attributes)
    instructions.destroy_all
    instruction_attributes.values.each {|instruction_attribute|
      instruction = Instruction.create(content: instruction_attribute[:content])
      instructions << instruction
    }
  end

  def self.search(search_term)
    where("name LIKE ? OR ingredients LIKE ? OR user LIKE ?", "%#{search_term}", "%#{search_term}", "%#{search_term}")
  end

  def convert_ingredient_quantity_to(ingredient_name, unit_name)
    pieces = ingredient_quantity(ingredient_name).split(" ")
    unit_new = Unit.find_by(name: unit_name)
    unit_old = Unit.find_by(name: pieces[1].singularize)
    quantity_old = pieces[0].to_f
    quantity_lowest_unit = quantity_old * unit_old.lowest_unit_equivalence
    quantity_new = quantity_lowest_unit / unit_new.lowest_unit_equivalence
    "#{quantity_new.round(2)} #{unit_new.name.pluralize(quantity_new)}"
  end

  def ingredient_quantity(ingredient_name)
    ingredient_object = ingredients.detect {|ingredient| ingredient.name = ingredient_name}
    quantity_object = quantities.detect {|quantity| quantity.ingredient = ingredient_object}
    "#{quantity_object.amount.round(2)} #{quantity_object.unit.name.pluralize(quantity_object.amount)}"
  end

end
