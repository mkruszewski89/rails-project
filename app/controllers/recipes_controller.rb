class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.quantities.build(amount: "")
    @recipe.quantities.build(amount: "")
    @recipe.instructions.build(content: "")
    @recipe.instructions.build(content: "")
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = User.all[0]
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, quantities_attributes: [:amount, :ingredient, :unit], instructions_attributes: [:content])
  end

end
