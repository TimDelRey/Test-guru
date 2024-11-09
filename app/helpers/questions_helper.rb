module QuestionsHelper
  def question_header(test)
    form_title = ["В категории '#{test.title}' создать вопрос", "В категории '#{test.title}' редактировать вопрос"]
    if @question.persisted?
      form_title[1]
    else
      form_title[0]
    end
  end
end
