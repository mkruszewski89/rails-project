class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def user_name
    user.name
  end

  def sorted_ingredients
    ingredients.sort_by {|ingredient| ingredient.name}
  end

  def instructions_array
    instructions.split("|")
  end

end
