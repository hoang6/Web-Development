class User
  def self.find_by_id(id)
    user_data = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        users.id = ?
    SQL

    User.new(user_data);
  end

  def initialize(options)
    @id, @fname, @lname =
      options.values_at('id', 'fname', 'lname');
  end

  def self.find_by_name(fname, lname)
    user_data = QuestionDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        users.fname = fname AND users.lname = lname
    SQL

    User.new(user_data);
  end

  def authored_questions
    Question.find_by_author_id(id)
  end

  def authored_replies
    Reply.find_by_author_id(id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(id)
  end

  def liked_questions
    QuestionFollow.liked_questions_for_user_id(id)
  end

  def self.average_karma
    QuestionDatabase.instance.execute(<<-SQL, author_id: self.id)
      SELECT
        COUNT(question_likes.author_id)
      JOIN
        questions
      LEFT OUTER JOIN
        question_likes ON question_likes.question_id = questions.id
      WHERE
        question.author_id = :author_id
    SQL

    # questions_data.map { |question_data| Question.new(question_data) }
  end
end
