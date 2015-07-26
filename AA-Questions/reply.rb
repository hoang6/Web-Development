class Reply
  def self.find_by_id(id)
    reply_data = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.id = ?
    SQL

    Reply.new(reply_data);
  end

  def initialize(options)
    @id, @question_id, @parent_id, @author_id, @body  =
      options.values_at('id', 'question_id', '@parent_id', 'author_id', 'body');
  end

  def self.find_by_author_id(author_id)
    replies_data = QuestionDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.author_id = ?
    SQL

    replies_data.map { |reply_data| Reply.new(reply_data) }
  end

  # Have to recheck this one
  def self.find_by_question_id(question_id)
    replies_data = QuestionDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.question_id = ?
    SQL

    replies_data.map { |reply_data| Reply.new(reply_data) }
  end

  def self.find_by_parent_id(parent_id)
    replies_data = QuestionDatabase.instance.execute(<<-SQL, parent_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.parent_id = ?
    SQL

    replies_data.map { |reply_data| Reply.new(reply_data) }
  end

  def author
    User.find_by_author_id(author_id)
  end

  def question
    Question.find_by_question_id(question_id)
  end

  def parent_reply
    Reply.find_by_id(parent_id)
  end

  def child_replies
    Reply.find_by_parent_id(id)
  end
end
