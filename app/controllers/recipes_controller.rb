class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.map{|i| i.name}
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to new_recipe_ingredients_path(@recipe)
    else
      render :new
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

def search
  logger.debug(params[:search])
  @recipes = Recipe.find_with_ingredient(params[:search])
  render 'ingredients/searchResults'
end

  protected

  def recipe_params
    params.require(:recipe).permit(
      :title, :cook_time, :ingredients, :directions, :poster_image_url
    )
  end

end