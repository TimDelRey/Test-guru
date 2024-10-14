class QuestionsController < ApplicationController

  before_action :found_test, only: [:index, :new, :create]
  before_action :found_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    render inline: '<%= @questions.pluck(:id, :body).join("\n")%>'
  end

  def new; end

  def show
    render inline: '<%= @question.body%>'
  end

  def create
    @question = @test.questions.build(params.require(:question).permit(:body))
    if @question.save
      redirect_to test_questions_path
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path
    # render inline: '<p>Результат удаления вопроса: <%=  !!@question %></p>'
    # redirect_to test_questions_path(@question)
  end

  private

  def found_test
    @test = Test.find(params[:test_id])
  end

  def found_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопроса не существует', status: :not_found
  end
end
