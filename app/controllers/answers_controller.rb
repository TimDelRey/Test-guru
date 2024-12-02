# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :search_question, only: %i[index new create]
  before_action :search_answer, only: %i[edit update destroy]

  def index
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_to question_answers_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to question_answers_path(question_id: @answer.question.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to question_answers_path(question_id: @answer.question.id) if @answer.destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct, :question_id)
  end

  def search_question
    @question = Question.find(params[:question_id])
  end

  def search_answer
    @answer = Answer.find(params[:id])
  end

end
