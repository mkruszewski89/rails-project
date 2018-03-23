User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
Instruction.destroy_all
Unit.destroy_all
Quantity.destroy_all

Ingredient.create
Unit.create
Unit.create(lowest_unit: 'milliliter', lowest_unit_equivalence: 1.00000, name: 'milliliter')
Unit.create(lowest_unit: 'milliliter', lowest_unit_equivalence: 4.92892, name: 'teaspoon')
Unit.create(lowest_unit: 'milliliter', lowest_unit_equivalence: 14.7868, name: 'tablespoon')
Unit.create(lowest_unit: 'milliliter', lowest_unit_equivalence: 29.5735, name: 'fluid ounce')
Unit.create(lowest_unit: 'milliliter', lowest_unit_equivalence: 236.588, name: 'cup')
Unit.create(lowest_unit: 'milliliter', lowest_unit_equivalence: 473.176, name: 'pint')
Unit.create(lowest_unit: 'milliliter', lowest_unit_equivalence: 946.353, name: 'quart')
Unit.create(lowest_unit: 'milliliter', lowest_unit_equivalence: 1000.00, name: 'liter')
Unit.create(lowest_unit: 'milliliter', lowest_unit_equivalence: 3785.41, name: 'gallon')
Unit.create(lowest_unit: 'gram', lowest_unit_equivalence: 1.00000, name: 'gram')
Unit.create(lowest_unit: 'gram', lowest_unit_equivalence: 28.3495, name: 'ounce')
Unit.create(lowest_unit: 'gram', lowest_unit_equivalence: 453.592, name: 'pound')
Unit.create(lowest_unit: 'gram', lowest_unit_equivalence: 1000.00, name: 'kilogram')

test_user =
  User.create(
    name: "test user",
    email: "test@test.com",
    password: "password"
)

seed_quantity_attributes = {
  "0" => {
    amount: "10",
    unit: "teaspoon",
    ingredient: "test ingredient 1"
  },
  "1" => {
    amount: "2",
    unit: "pound",
    ingredient: "test ingredient 2"
  }
}

seed_instruction_attributes = {
  "0" => {
    content: "test instruction 1"
  },
  "1" => {
    content: "test instruction 2"
  }
}

test_recipe = Recipe.new
test_recipe.user = test_user
test_recipe.name = "test recipe"
test_recipe.quantities_attributes=(seed_quantity_attributes)
test_recipe.instructions_attributes=(seed_instruction_attributes)
test_recipe.save
