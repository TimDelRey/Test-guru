module QuestionsHelper
  def question_header(test)
    @question.persisted? ? "В категории '#{test.title}' создать вопрос" : "В категории '#{test.title}' редактировать вопрос"
  end
end
