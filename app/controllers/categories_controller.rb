# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :search_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show
    @tests = @category.tests.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to categories_path if @category.destroy
  end

  private

  def search_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
