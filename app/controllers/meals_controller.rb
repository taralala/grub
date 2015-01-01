class MealsController < ApplicationController
  before_action :get_meal, only: [:update, :edit, :destroy]
  
  def index
    @meals = Meal.all
  end
  
  def new
  end
  
  def create
    @meal = Meal.new meal_params  
    @meal.save
    redirect_to meals_path
  end
  
  def update
    @meal.update meal_params
    redirect_to meals_path
  end
  
  def edit
  end
  
  def destroy
    @meal.destroy
    redirect_to meals_path
  end
  
  private
  
  def meal_params
    params.require(:meal).permit(:name, :description)
  end
  
  def get_meal
    @meal = Meal.find params[:id]
  end
end