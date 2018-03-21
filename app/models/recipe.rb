class Recipe < ApplicationRecord
  belongs_to :user
  has_many :instructions
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :ingredients, :instructions
  validates :name, presence: true

end
