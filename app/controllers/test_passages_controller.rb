class TestPassagesController < ApplicationController

  before_action :search_test_and_user, only: %i[show update result]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.complited?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def search_test_and_user
    @test_passage = TestPassage.find(params[:id])
    @test = @test_passage.test
    @user = @test_passage.user
  end
end
