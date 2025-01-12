class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "First")
    @recipe.ingredients.build(name: "Second")
  end

  def create
    Recipe.create(recipe_params)
    redirect_to recipe_params
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes:[:name, :quantity])
  end
end
