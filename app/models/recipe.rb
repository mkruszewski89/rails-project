class Recipe < ApplicationRecord
  belongs_to :user
  has_many :instructions
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true

  def sorted_ingredients
    ingredients.sort_by {|ingredient| ingredient.name} if ingredients
  end

  def instruction_contents=(contents)
    contents.each {|content| instructions << Instruction.create(content: content)}
  end

  def instruction_contents
    instructions.collect {|instruction| instruction.content}
  end

end
