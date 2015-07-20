class Reply
  attr_reader :id
  attr_accessor :question_id, :parent_reply_id,
                :author_id, :body

  def initialize(options = {})
    @id, @question_id, @parent_reply_id, @author_id, @body =
      options.values_at('id', 'question_id', 'parent_reply_id', 'author_id', 'body')
  end

  def self.find_by_id(id)
    reply_data = QuestionsDatabase.execute(<<-SQL, id: id)
    SELECT
      *
    FROM
      replies
    WHERE
      replies.id = :id
    SQL

    Reply.new(reply_data)
  end

  def self.find_by_user_id(author_id)
    reply_data = QuestionsDatabase.execute(<<-SQL, author_id: author_id)
    SELECT
      *
    FROM
      replies
    WHERE
      replies.author_id = :author_id
    SQL
  end

  def self.find_by_question_id(question_id)
    reply_data = QuestionsDatabase.execute(<<-SQL, question_id: question_id)
    SELECT
      *
    FROM
      replies
    WHERE
      replies.question_id = question_id
    SQL
  end

  def author
    User.find_by_id(author_id)
  end

  def question
    Question.find_by_id(question_id)
  end

  def parent_reply
    Reply.find_by_id(parent_reply_id)
  end

  def child_replies
    
  end
end
