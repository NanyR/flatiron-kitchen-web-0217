require 'pry'
class IngredientsController < ApplicationController

  def new
    @ingredient=Ingredient.new
  end

  def create
    # binding.pry
    @ingredient=Ingredient.new(ingredient_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def edit
    @ingredient=set_ingredient
  end

  def update
    @ingredient=set_ingredient
    @ingredient.update(ingredient_params(:name))
    if @ingredient.valid?
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  def show
    @ingredient=set_ingredient
  end




  private

  def set_ingredient
    Ingredient.find_by_id(params[:id])
  end

  def ingredient_params(*args)
    params.require(:ingredient).permit(:name)
  end
end
