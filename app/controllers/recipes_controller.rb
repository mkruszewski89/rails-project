class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
