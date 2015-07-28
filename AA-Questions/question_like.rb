class QuestionLike
  # def self.find_by_id(id)
  #   question_like_data = QuestionDatabase.instance.execute(<<-SQL, id)
  #     SELECT
  #       *
  #     FROM
  #       question_likes
  #     WHERE
  #       question_likes.id = ?
  #   SQL
  #
  #   QuestionFollow.new(question_like_data);
  # end

  def initialize(options)
    @id, @question_id, @author_id =
      options.values_at('id', 'question_id', 'author_id');
  end

  def self.likers_for_question_id(question_id)
    likers_data = QuestionDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes ON users.id = question_likes.liker_id
      WHERE
        question_likes.question_id = ?
    SQL

    likers_data.map { |liker_data| User.new(liker_data) }
  end

  def self.num_likes_for_question_id(question_id)
    QuestionDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*) as likes
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        questions.id = ?
    SQL
  end

  def self.liked_questions_for_user_id(user_id)
    questions_data = QuestionDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON question_likes.question_id = questions.id
      WHERE
        question_likes.liker_id = user_id
    SQL

    questions_data.map { |question_data| Question.new(question_data) }
  end

  def self.most_liked_questions(n)
    questions_data = QuestionDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON question_likes.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        n
    SQL

    questions_data.map { |question_data| Question.new(question_data) }
  end


end
