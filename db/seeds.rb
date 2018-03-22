# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
Instruction.destroy_all
Unit.destroy_all
test_user = User.create(email: "test@test.com", password: "password")
test_recipe = Recipe.create(name: "test recipe", user: test_user)
test_instruction_1 = Instruction.create(content: "test instruction 1", recipe: test_recipe)
test_instruction_2 = Instruction.create(content: "test instruction 2", recipe: test_recipe)
test_ingredient_1 = Ingredient.create(name: "apple")
test_ingredient_2 = Ingredient.create(name: "asparagus")
test_quantity_1 = 100
test_quantity_2 = 200
RecipeIngredient.create(recipe: test_recipe, ingredient: test_ingredient_1, quantity: test_quantity_1)
RecipeIngredient.create(recipe: test_recipe, ingredient: test_ingredient_2, quantity: test_quantity_2)

Unit.new(lowest_unit: milliliter, lowest_unit_equivalence: 1.00000, name: milliliter)
Unit.new(lowest_unit: milliliter, lowest_unit_equivalence: 4.92892, name: teaspoon)
Unit.new(lowest_unit: milliliter, lowest_unit_equivalence: 14.7868, name: tablespoon)
Unit.new(lowest_unit: milliliter, lowest_unit_equivalence: 29.5735, name: fluid ounce)
Unit.new(lowest_unit: milliliter, lowest_unit_equivalence: 236.588, name: cup)
Unit.new(lowest_unit: milliliter, lowest_unit_equivalence: 473.176, name: pint)
Unit.new(lowest_unit: milliliter, lowest_unit_equivalence: 946.353, name: quart)
Unit.new(lowest_unit: milliliter, lowest_unit_equivalence: 1000.00, name: liter)
Unit.new(lowest_unit: milliliter, lowest_unit_equivalence: 3785.41, name: gallon)
Unit.new(lowest_unit: gram, lowest_unit_equivalence: 1.00000, name: gram)
Unit.new(lowest_unit: gram, lowest_unit_equivalence: 28.3495, name: ounce)
Unit.new(lowest_unit: gram, lowest_unit_equivalence: 453.592, name: pound)
Unit.new(lowest_unit: gram, lowest_unit_equivalence: 1000.00, name: kilogram)
