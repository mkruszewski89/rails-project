module RecipesHelper

  def display_recipe_name(recipe)
    recipe.name.titleize
  end

  def display_recipe_user_email(recipe)
    recipe.user.email
  end

end
