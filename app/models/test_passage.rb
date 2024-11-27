class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def complited?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.order(:id).first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers = current_question.answers.correct

    puts "Правильные ответы: #{correct_answers.ids.sort}"
    puts "Ответы полученные Answer IDs: #{answer_ids.to_a.map(&:to_i).sort}"
  # byebug
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
