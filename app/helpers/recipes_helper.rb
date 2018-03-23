module RecipesHelper

  def display_recipe_name(recipe)
    recipe.name.titleize
  end

  def display_recipe_user_name(recipe)
    recipe.user.name.titleize
  end

end
