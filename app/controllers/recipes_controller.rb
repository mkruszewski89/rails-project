class RecipesController < ApplicationController
  before_action :recipe_set, only: [:show, :edit, :update, :destroy]
  before_action :recipe_authorization, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @recipes = Recipe.search_by_name(params[:search])
    else
      @recipes = Recipe.all
    end
  end

  def new
    if !current_user
      flash[:message] = "You must be logged in to create a recipe!"
      redirect_to new_user_registration_path
    else
      @recipe = Recipe.new
      @recipe.quantities.build(amount: "", unit: Unit.all[0], ingredient: Ingredient.all[0])
      @recipe.quantities.build(amount: "", unit: Unit.all[0], ingredient: Ingredient.all[0])
      @recipe.instructions.build(content: "")
      @recipe.instructions.build(content: "")
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
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
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_set
    @recipe = Recipe.find(params[:id])
  end

  def recipe_authorization
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def recipe_params
    params.require(:recipe).permit(:user, :name, quantities_attributes: [:amount, :ingredient, :unit], instructions_attributes: [:content])
  end

end
