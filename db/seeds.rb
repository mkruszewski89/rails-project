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
RecipeIngredient.destroy_all
test_user = User.create(email: "test@test.com", password: "password")
test_recipe = Recipe.create(name: "test recipe", instructions: "test instruction 1|test instruction 2|test instruction 3", user: test_user)
test_ingredient_1 = Ingredient.create(name: "test ingredient 1")
test_ingredient_2 = Ingredient.create(name: "test ingredient 2")
test_quantity_1 = 100
test_quantity_2 = 200
RecipeIngredient.create(recipe: test_recipe, ingredient: test_ingredient_1, quantity: test_quantity_1)
RecipeIngredient.create(recipe: test_recipe, ingredient: test_ingredient_2, quantity: test_quantity_2)
