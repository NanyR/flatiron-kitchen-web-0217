
class RecipesController < ApplicationController

  def new
    @recipe=Recipe.new

  end

  def create
    @recipe= Recipe.new(recipe_params(:name, ingredient_ids: []))
    if @recipe.valid?
      @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def edit
    @recipe=set_recipe
  end

  def update
    @recipe=set_recipe
    @recipe.update(recipe_params(:name, ingredient_ids: []))
    if @recipe.valid?
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def show
    @recipe= set_recipe
  end


  private

  def set_recipe
    Recipe.find_by_id(params[:id])
  end

  def recipe_params(*args)
    params.require(:recipe).permit(*args)
  end

end
