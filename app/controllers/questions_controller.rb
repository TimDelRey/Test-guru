# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :search_test, only: %i[index new create]
  before_action :search_question, only: %i[show destroy edit update]

  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    # @questions = @test.questions
    # render inline: '<%= @questions.pluck(:id, :body).join("\n")%>'
    redirect_to @test
  end

  def show
    render inline: '<%= @question.body%>'
  end
  
  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to test_questions_path
    else
      render :new
    end
  end

  def edit
    @test = @question.test
  end

  def update
    if @question.update(question_params)
      redirect_to test_path(id: @question.test.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to test_path(id: @question.test.id) if @question.destroy
    # render inline: '<p>Результат удаления вопроса: <%=  !!@question %></p>'
    # redirect_to test_questions_path(@question)
  end

  private

  def search_test
    @test = Test.find(params[:test_id])
  end

  def search_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Вопроса не существует', status: :not_found
  end
end
