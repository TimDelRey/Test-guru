module QuestionsHelper
  def question_header(test)
    @question.persisted? ? "В категории '#{test.title}' редактировать вопрос" : "В категории '#{test.title}' создать вопрос"
  end
end
