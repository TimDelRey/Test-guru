module TestPassagesHelper

  def question_counter(test_passage)
    test_questions = test_passage.test.questions.order(:id)
    "Вопрос #{test_questions.find_index(test_passage.current_question) + 1} из #{test_questions.size}"
  end
end
