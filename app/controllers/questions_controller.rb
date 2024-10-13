class QuestionsController < ApplicationController

  before_action :found_test, only: [:show, :new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @test = Test.find(params[:test_id])
    @questions = @test.questions.all
    render inline: '<%= @questions.pluck(:id, :body).join("\n")%>'
  end

  def new
  end

  def show
    # render inline: '<%= Question.find(params[:id]).body%>'
    # render json: Question.find(params[:id])
    @question = @test.questions.find(params[:id])
    render inline: '<%= @question.body%>'
  end

  def create
    @question = @test.questions.create(params.require(:question).permit(:body))
    render inline: '<p>Результат создания вопроса: <%=  !!@question.valid? %></p>'
    # render plain: question.inspect
    # redirect_to test_questions_path
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    render inline: '<p>Результат удаления вопроса: <%=  !!@question %></p>'
    # redirect_to test_questions_path(@question)
  end

  private

  def found_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопроса не существует'
  end
end
