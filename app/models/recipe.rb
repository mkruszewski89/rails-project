class Recipe < ApplicationRecord
  belongs_to :user
  has_many :instructions
  has_many :quantities
  has_many :ingredients, through: :quantities
  accepts_nested_attributes_for :quantities, :instructions
  validates :name, presence: true

  def quantities_attributes=(quantity_attributes)
    quantity_attributes.values.each {|quantity_attribute|
      amount = quantity_attribute[:amount].to_f
      unit = Unit.find_by(name: quantity_attribute[:unit])
      ingredient = Ingredient.find_or_create_by(name: quantity_attribute[:ingredient])
      quantity = Quantity.create(amount: amount, unit: unit, ingredient: ingredient)
      self.quantities << quantity
    }
  end

end
