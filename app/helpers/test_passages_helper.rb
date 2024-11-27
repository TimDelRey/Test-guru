module TestPassagesHelper
  def test_result(test_passage)
    pass_percent = 85.freeze
    result_factor = test_passage.correct_questions.to_f / test_passage.test.questions.count
    test_result_percent = result_factor * 100

    if test_result_percent >= pass_percent
      result = "<span class='result-green'>Тест успешно пройден</span>"
    else 
      result = "<span class='result-red'>Тест не пройден</span>"
    end

    "#{result}<br>#{test_result_percent.to_i}% правильных ответов".html_safe
  end
end
