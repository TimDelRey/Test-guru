# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :search_test, only: %i[show edit update]

  def index
    # render inline: '<%= Test.all.pluck(:id, :title)%>'
    @tests = Test.all
  end

  def show
    @tests_title = @test.title
    @tests_questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render :edit
    end
  end

  def search_test
    @test = Test.find(params[:id])
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end
end
