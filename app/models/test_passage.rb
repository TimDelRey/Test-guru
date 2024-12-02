# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  PASS_PERCENT = 85

  def complited?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    self.current_question = next_question
    save!
  end

  def test_result
    result_factor = self.correct_questions.to_f / self.test.questions.count
    test_result_percent = result_factor * 100

    result = if test_result_percent >= PASS_PERCENT
               "<span class='result-green'>Тест успешно пройден</span>"
             else
               "<span class='result-red'>Тест не пройден</span>"
             end

    "#{result}<br>#{test_result_percent.to_i}% правильных ответов".html_safe
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.order(:id).first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers = current_question.answers.correct

    puts "Правильные ответы: #{correct_answers.ids.sort}"
    puts "Ответы полученные Answer IDs: #{answer_ids.to_a.map(&:to_i).sort}"
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
    # correct_answer_count = correct_answers.count
    # (correct_answer_count == correct_answers.where(id: answer_ids).count) &&
    # correct_answer_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
