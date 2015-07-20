class Question
  attr_accessor :id, :title, :body, :author_id

  def initialize(options = {})
    @id, @title, @body, @author_id =
      options.values_at('id', 'title', 'body', 'author_id')
  end

  def self.find_by_id(id)
    question_data = QuestionsDatabase.execute(<<-SQL, id: id)
    SELECT
      *
    FROM
      questions
    WHERE
      questions.id = id
    SQL

    Question.new(question_data)
  end

  def find_by_author(author_id)
    question_data = QuestionsDatabase.execute(<<-SQL, author_id: author_id)
    SELECT
      *
    FROM
      questions
    WHERE
      questions.author_id = author_id
    SQL
  end

  def author
    User.find_by_id(author_id)
  end

  def replies
    Reply.find_by_question_id(id)
  end
end
